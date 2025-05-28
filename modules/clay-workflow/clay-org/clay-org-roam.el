;;; clay-org-roam.el --- setup org roam configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

;; Author: Lucas Elvira Martín <lucaselvira96@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(defgroup clay-org-roam nil
          "Group for org settings."
          :group 'clay-org
          :tag "Clay Org Roam"
          :prefix 'clay-org-roam)

(defcustom clay-org-roam-directory "roam"
  "Main directory where org roam files are stored relative to `org-directory'."
  :set (lambda (k v)
         (set-default k v)
         (setq org-roam-directory (expand-file-name v org-directory)))
  :group 'clay-org-roam
  :type 'directory)

(defcustom clay-bibliography-files '()
  "List of the .bib to get the bibliography relatives to `org-directory'."
  ;; :set (lambda (k v) (set-default k (mapcar (lambda (file) (expand-file-name file org-directory)) v)))
  :group 'clay-org-roam
  :type '(repeat string))

(defcustom clay-org-roam-journal nil
  "Whether to setup org roam dailies or not."
  :set (lambda (k v)
         (setq k (mapcar (lambda (f)
                   (expand-file-name f clay-org-directory)) v)))
  :group 'clay-org-roam
  :type 'boolean)


(defcustom clay-org-roam-denote t
  "Whether to load denote package."
  :group 'clay-org-roam
  :type 'boolean)

(defcustom clay-org-roam-glossary-file "glossary.tex"
  "File where the custom accronyms will be stored relative to clay-org-roam-directory."
  :group 'clay-org-roam
  :type 'string)

;;;###autoload
(defun clay-org-roam-filter-by-tag (tag-name)
  "Return a predicate that check if a node has TAG-NAME."
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

;;;###autoload
(defun clay-org-roam-list-notes-by-tag (tag-name)
  "Return list of files tagged with TAG-NAME."
  (mapcar #'org-roam-node-file
          (seq-filter
           (clay-org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

;;;###autoload
(defun clay-org-roam-refresh-agenda-list ()
  "Add project-tagged notes to `org-agenda-files`."
  (interactive)
  (customize-set-variable
    'org-agenda-files
    (delete-dups
      (append org-agenda-files
              (clay-org-roam-list-notes-by-tag "Project")))))

;;;###autoload
(defun org-roam-node-insert-immediate (arg &rest args)
  "Insert a node immediately without completing capture."
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;;;###autoload
(defun clay-org-roam-capture-task ()
  "Capture a TODO in a project."
  (interactive)
  (org-roam-capture-
   :node (org-roam-node-read
          nil
          (clay-org-roam-filter-by-tag "Project"))
   :templates '(
                ("p" "project" entry "** TODO %?\nAdded at: %U"
                 :if-new (file+head+olp
                          "%<%Y%m%d%H%M%S>-${slug}.org"
                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                          ("Tasks")))
                ("s" "start now" entry "** TODO %?"
                 :if-new (file+head+olp
                          "%<%Y%m%d%H%M%S>-${slug}.org"
                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                          ("Tasks"))
                 :clock-in :clock-resume)
                ("m" "Meeting")
                ("mp" "Prepare meeting" entry "** %U\n %?"
                 :if-new (file+head+olp
                          "%<%Y%m%d%H%M%S>-${slug}.org"
                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                          ("Meetings"))
                 :target (file+olp+datetree "%<%Y%m%d%H%M%S>-${slug}.org" ("Meetings"))))))

(defun clay-org-roam-refile (&optional p-visit)
  "Refile current heading as a child of the 'Tasks' heading in a tagged org-roam node.
If the 'Tasks' heading does not exist, it will be created at the end of the file.
If P-VISIT is non-nil, point is moved to the destination."
  (interactive)
  (let* ((node (org-roam-node-read nil (clay-org-roam-filter-by-tag "Project") nil :require-match))
         (file (org-roam-node-file node))
         (marker nil)
         (heading-to-move (org-get-heading nil nil nil nil)))
    ;; Ensure destination exists and get its position
    (with-current-buffer (find-file-noselect file)
      (goto-char (point-min))
      (if (re-search-forward "^\\*+ Tasks" nil t)
          (setq marker (copy-marker (match-beginning 0)))
        ;; Create "Tasks" heading if it doesn't exists
        (progn
          (goto-char (point-max))
          (unless (bolp) (newline))
          (insert "* Tasks\n")
          (setq marker (copy-marker (point-at-bol))))))
    ;; Refile using org-refile
    (org-refile nil nil (list heading-to-move file nil marker))))

(use-package! org-roam
              :after org
              :init (setq org-roam-v2-ack t)
              :custom
              (org-roam-completion-everywhere t)
              (org-roam-list-files-commands '(fd fdfind rg find))
              (org-roam-file-extensions '("org" "md")) ;; needed for md-roam
              :config
              (setq org-roam-directory (expand-file-name clay-org-roam-directory org-directory))
              (setq org-roam-capture-templates
                    '(("f" "Fleeting" plain "%?"
                       :if-new
                       (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                  "#+TITLE: ${title}\n#+DATE: %U\n#+AUTHOR: %n\n#+filetags: :fleeting:")
                       :unnarrowed nil)
                      ("P" "Permanent" plain "%?"
                       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                          "#+TITLE: ${title}\n#+DATE: %U\n#+filetags: :PERMANENT:\n* ${title}\n\n")
                       :unnarrowed t)
                      ("d" "default" plain "%?"
                       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                          "#+title: ${title}\n#+date: %U\n#+author: %n\n")
                       :unnarrowed t)
                      ("p" "project" plain
                       "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
                       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
                       :unnarrowed t)))
              (setq org-roam-node-display-template
                    (concat "${title:*} "
                            (propertize "${aliases:10}")
                            (propertize "${tags:30}"  'face 'org-tag)
                            (propertize "${date:10}"  'face 'org-date)))
              (if (file-directory-p org-roam-directory)
                   (org-roam-db-autosync-mode)
                  (message "Warning: %s don't exists" org-roam-directory))
              (cl-defmethod org-roam-node-date
                ((node org-roam-node))
                (format-time-string "%Y-%m-%d" (org-roam-node-file-mtime node)))
              (clay-org-roam-refresh-agenda-list)

              )


(use-package! citar
              :after org-roam
              :preface
              (defun clay--expand-bibliography-path (files)
                "Given a list of fILES, return a new list with the `org-directory' prefix."
                (mapcar (lambda (file)
                          (expand-file-name file org-directory)) files))
              :custom
              (org-cite-insert-processor 'citar)
              (org-cite-follow-processor 'citar)
              (org-cite-activate-processor 'citar)
              (org-cite-global-bibliography (clay--expand-bibliography-path clay-bibliography-files))
              (citar-bibliography (clay--expand-bibliography-path clay-bibliography-files))
              :config
              (setq citar-templates
                    '((main . "${author editor:30%sn}     ${date year issued:4}     ${title:48}")
                      (suffix . "          ${=key= id:15}    ${=type=:12}    ${tags keywords:*}")
                      (preview . "${author editor:%etal} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
                      (note . "Notes on ${author editor:%etal}, ${title}"))
                    bibtex-completion-bibliography (clay--expand-bibliography-path clay-bibliography-files)))


(use-package! citar-org-roam
              :after (citar org-roam)
              :config (citar-org-roam-mode)
              (add-to-list 'org-roam-capture-templates
                           '("r" "Bibliography reference" plain
                             "* ${citar-title}\n%?"
                             :if-new (file+head
                                      "%<%Y%m%d%H%M%S>-${citar-citekey}.org"
                                      "#+TITLE: ${citar-citekey}\n#+AUTHOR: ${citar-author}\n#+cite-date: ${citar-date}\n#+filetags: :LITERATURE:\n#+date: %U\n")
                             :unnarrowed t) t)
(setq citar-org-roam-note-title-template "${author} - ${title}"
      citar-org-roam-capture-template-key "r"))

(defun clay-import-notes-from-zotero (key &optional _entry)
  "Import LaTeX 'note' field from Zotero entry and convert to Org."
  (interactive (list (citar-select-ref)))
  (let* ((entry (bibtex-completion-get-entry key))
         (note (bibtex-completion-get-value "note" entry ""))
         (pandoc-command "pandoc --from latex --to org")
         result)
    (with-temp-buffer
      (shell-command (format "echo \"%s\" | %s" note pandoc-command)
                     (current-buffer))
      (setq result (buffer-substring-no-properties (point-min) (point-max))))
    (insert result)))

(defun clay-add-acronym (label abbrv full)
  "Add acronym to LaTeX preamble and glossary.tex."
  (interactive "sLabel: \nsAccronym: \nsFull text: ")
  (save-excursion
    (re-search-backward "#\\+latex_header" nil t)
    (forward-line)
    (when (not (looking-at "^$"))
      (beginning-of-line)
      (insert "\n")
      (forward-line -1))
    (insert (format "#+latex_header_extra: \\newacronym{%s}{%s}{%s}\n"
                    label abbrv full))
  (write-region
     (format
      "\\newacronym{%s}{%s}{%s}\n"
      label abbrv full)
     nil (expand-file-name clay-org-roam-glossary-file org-roam-directory) 'append)))

(use-package! org-roam-ui
              :remote
              (:host github :repo "org-roam/org-roam-ui"
                     :branch "main" :files ("*.el" "out"))
              :after org-roam
              :config
              (setq org-roam-ui-sync-theme t
                    org-roam-ui-follow t
                    org-roam-ui-update-on-save t
                    org-roam-ui-open-on-start t))

(when clay-org-roam-denote
  (use-package! denote
                :after org
                :hook (dired-mode . denote-dired-mode-in-directories)
                :config
                (setq denote-directory org-roam-directory
                      denote-file-type "org"
                      denote-infer-keywords t
                      denote-prompts '(title keywords signature)
                      denote-dired-directories (list denote-directory))))


(provide 'clay-org-roam)
;;; clay-org-roam.el ends here
