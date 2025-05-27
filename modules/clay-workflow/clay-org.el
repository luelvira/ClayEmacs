;;; clay-org.el --- base configuration for org mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

;; Author: Lucas Elvira Martín <lucaselvira96@gmail.com>
;; Keywords: text

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

;;; Code:

(defgroup clay-org nil
          "Group for org settings."
          :group 'clay
          :tag "Clay Org"
          :prefix 'clay-org)

(defcustom clay-org-directory "~/org"
           "Main directory where org files are stored."
           :set (lambda (k v)
                  (set-default k v)
                  (setq org-directory v))
           :type 'directory
           :group 'clay-org)

(defcustom clay-org-agenda-files
  '("Tasks.org" "Habits.org" "Projects.org" "Agenda.org" "Meetings.org")
  "Relative paths from `clay-org-directory'. to be used in the agenda."
  :type '(repeat string)
  :group 'clay-org)

(defcustom clay-org-default-notes-file "Inbox.org"
  "Default entry point for org capture."
  :type 'string
  :group 'clay-org)

(defcustom clay-org-capture-todo-file "Tasks.org"
  "Default entry point to capture personal tasks before process them."
  :type 'string
  :group 'clay-org)

(defcustom clay-org-capture-meetings-file "Meetings.org"
  "Default entry point to capture meetings before process them."
  :type 'string
  :group 'clay-org)

(defcustom clay-org-capture-journal-file "Journal.org"
  "Default entry point to capture journal."
  :type 'string
  :group 'clay-org)

(defcustom clay-org-pomodoro? nil
  "Whether to setup pomodoro or not."
  :type 'boolean
  :group 'clay-org)

(defcustom clay-org-notify? t
  "Whether to send notify from org."
  :type 'boolean
  :group 'clay-org)

(defcustom clay-org-journal? nil
  "Whether to load org-journal."
  :type 'boolean
  :group 'clay-org)

(defcustom clay-org-roam? t
  "Whether to load org-roam."
  :type 'boolean
  :group 'clay-org)
  
;;; org-mode configuration

(defun clay-org-apply-config ()
  "Synchronize `org-mode' settings with `clay-org' variables."
  (setq org-directory clay-org-directory)
  (setq org-default-notes-file (expand-file-name clay-org-default-notes-file clay-org-directory))
  (setq org-agenda-files (mapcar (lambda (f)
                                   (expand-file-name f clay-org-directory))
                                 clay-org-agenda-files))
  (setq org-id-locations-file (expand-file-name ".orgids" clay-org-directory)))


(defun clay--org-mode-hooks ()
  "Hook to run when entering `org-mode'."
  (variable-pitch-mode)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(defun clay-start-task ()
  "Start a clock when a task change the state from TOOD to IN PROGRESS."
    (when (string= (org-get-todo-state) "STRT")
           (org-clock-in))
    (when (and (string= (org-get-todo-state) "NEXT")
               (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))

(defun clay--org-setup-font-appearance ()
  "Set font and indentation settings for Org faces."
  ; (set-face-attribute 'org-block           nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table           nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula         nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code            nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-date            nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-indent          nil :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-verbatim        nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line       nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox        nil :inherit 'fixed-pitch))

(defun clay--org-init-appearance ()
  "Configure teh UI for the `org-mode'."
  (setq org-indirect-buffer-display 'current-window
        org-enforce-todo-dependencies t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-src-fontify-natively t
        org-tags-columns 0
        ;; when emacs set as default the value showeverithing, overwrite custom visibilities
        org-startup-folded 'showall
        org-hide-emphasis-markers t
        org-hide-block-startup nil)
  (setq org-todo-keywords '((sequence "TODO(t)" "STRT(s)" "BACK(b)" "|" "DONE(d!)")
                            (sequence "|" "HOLD(h)" "CANCELED(c)")))
  (setq org-tag-alist
        '((:startgroup) ;Put mutually exclusive tags here
          ("@college" . ?C)
          ("@home" . ?H)
          ("@PHD" . ?P)
          ("@UI" . ?U)
          (:endgroup)
          (:startgroup)
          ("INACTIVE" . ?I)
          ("TOC" . ?T)
          ("HIDDEN" . ?F)
          (:endgroup)))

  (setq org-use-tag-inheritance t ; I want to keep it active
        org-tags-exclude-from-inheritance '("PROJECT")))


(defun clay--org-init-agenda ()
  "Setup all variables and configuration needed for org agenda."
  (setq-default
   org-agenda-files (append org-agenda-files clay-org-agenda-files)
   org-agenda-window-setup 'current-window
   org-agenda-skip-unavailable-files t
   org-agenda-span 'week
   org-agenda-start-day "-3d"
   org-agenda-start-with-log-mode t
   org-agenda-time-in-grid t
   org-agenda-show-current-time-in-grid t
   org-agenda-skip-deadline-if-done t
   org-agenda-skip-scheduled-if-done t
   org-log-into-drawer t
   org-log-done 'time
   org-columns-default-format "%20CATEGORY(Category) %30ITEM(Task) %4TODO %6Effort(Estim){:} %20SCHEDULED %20DEADLINE %6CLOCKSUM(Clock) %TAGS")
  (setq org-agenda-custom-commands
        `(("d" "Dashboard" 
           ((agenda ""
                    ((org-deadline-warning-days 7)
                     (org-agenda-span 10)
                     (org-agenda-overriding-header "Agenda")
                     ))
            (alltodo ""
                     ((org-agenda-overriding-header "Sort by priority")
                      (org-agenda-sorting-strategy '(priority-down)))
                     (org-agenda-todo-ignore-scheduled 'all)
                     (org-agenda-todo-ignore-scheduled 'all)
                     org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))
            (todo "ACTIVATED"
                  ((org-agenda-overriding-header "Next Actions")
                   (org-agenda-max-todos nil)))
            (todo "TODO"
                  ((org-agenda-overriding-header "Unprocessed Inbox Tasks")
                   (org-agenda-files '(,(concat org-directory "Tasks.org")))
                   (org-agenda-text-search-extra-files nil))))))))

(defun clay--org-setup-capture ()
  "Setup some defaults variables and workflows."
  (setq org-default-notes-file clay-org-default-notes-file)
  (setq org-capture-templates
        `(("t" "Task")
          ("tq" "Quick Task" entry
           (file+headline clay-org-capture-todo-file "Inbox")
           "* TODO %?\nAdded at: %U" :empty-lines 1)
          ("tl" "Task With link" entry
           (file+headline clay-org-capture-todo-file "Inbox")
           "* TODO %?\nAdded at: %U from %a\n" :empty-lines 1)
          ("q" "Quick Meeting" entry
           (file+headline clay-org-capture-meetings-file "Meetings")
           "* %? :meeting:\nSCHEDULED: %^T")
          ("n" "Note" entry
           (file+headline clay-org-default-notes-file)
           "* Note (%a)\n/Entered on/ %U\n\n%?")
          ("j" "Journals")
          ("jj" "Journal entry" entry
           (file+olp+datetree clay-org-capture-journal-file "Notes")
           "\n* %<%H:%m>\n%?" :empty-lines 1)
          ("jl" "Journal with link" entry
           (file+olp+datetree clay-org-capture-journal-file "Notes")
           "\n* %<%H:%m>\nFrom: %a\n%?" :empty-lines 1))))

(defun clay--org-habit ()
  "Setup default configuration for org-habit."
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60
        org-habit-show-all-today nil
        org-habit-show-habits-only-for-today nil))

(defun clay--org-init-babel ()
  "Setup babel configuration."
  (setq org-src-tab-acts-natively t
        org-src-preserve-indentation nil
        org-confirm-babel-evaluate nil
        org-link-elisp-confirm-function nil
        org-src-window-setup 'other-window
        org-edit-src-content-indentation 0)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp  . t)
     (python      . t)
     (js          . t)
     (shell       . t)
     (eshell      . t)
     (gnuplot     . t)
     (haskell     . t)))
  (push '("conf-unix" . conf-unix) org-src-lang-modes)
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages))


;; autoloads function

;;;###autoload
(defun save-and-update-includes ()
  "Update the line numbers of #+INCLUDE:s in current buffer.
Only looks at INCLUDEs that have either :range-begin or :range-end.
This function does nothing if not in `org-mode', so you can safely
add it to `before-save-hook'."
  (interactive)
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (goto-char (point-min))
      (while (search-forward-regexp
              "^\\s-*#\\+INCLUDE: *\"\\([^\"]+\\)\".*:range-\\(begin\\|end\\)"
              nil 'noerror)
        (let* ((file (expand-file-name (match-string-no-properties 1)))
               lines begin end)
          (forward-line 0)
          (when (looking-at "^.*:range-begin *\"\\([^\"]+\\)\"")
            (setq begin (match-string-no-properties 1)))
          (when (looking-at "^.*:range-end *\"\\([^\"]+\\)\"")
            (setq end (match-string-no-properties 1)))
          (setq lines (decide-line-range file begin end))
          (when lines
            (if (looking-at ".*:lines *\"\\([-0-9]+\\)\"")
                (replace-match lines :fixedcase :literal nil 1)
              (goto-char (line-end-position))
              (insert " :lines \"" lines "\""))))))))

;;;###autoload
(defun decide-line-range (file begin end)
  "Visit FILE and decide which lines to include.
BEGIN and END are regexps which define the line range to use."
  (let (l r)
    (save-match-data
      (with-temp-buffer
        (insert-file-contents file)
        (goto-char (point-min))
        (if (null begin)
            (setq l "")
          (search-forward-regexp begin)
          (setq l (line-number-at-pos (match-beginning 0))))
        (if (null end)
            (setq r "")
          (search-forward-regexp end)
          (setq r (1+ (line-number-at-pos (match-end 0)))))
        (format "%s-%s" (+ l 1) (- r 1)))))) ;; Exclude wrapper

;;;###autoload
(defun clay-org-search ()
  (interactive)
  (let ((consult-ripgrep-command "rg --type org --line-buffered --color=always --max-columns=500 --line-number . -e ARG OPTS"))
  (consult-ripgrep org-directory)))

(use-package! org
              :remote (:type git :host github :repo "emacs-straight/org-mode")
              :hook ((org-mode . clay--org-mode-hook)
                     (org-mode . org-indent-mode)
                     (before-save . save-and-update-includes)
                     (org-after-todo-state-change . clay-start-task))
              :init (defun clay--org-mode-hook ()
                      (variable-pitch-mode)
                      (visual-line-mode 1)
                      (auto-fill-mode 1)
                      (setq evil-auto-indent nil)
                      (diminish org-indent-mode))
              :custom
              (org-archive-save-context-info '(time category itags))
              :config
              (clay-org-apply-config)
              (clay--org-init-appearance)
              (clay--org-init-agenda)
              (clay--org-setup-capture)
              (clay--org-habit)
              (setq org-table-convert-region-max-lines 20000
                    org-cycle-separator-lines 2
                    org-refile-targets '((nil :maxlevel . 2)
                                         (org-agenda-files :maxlevel . 2))
                    org-outline-path-complete-in-steps nil
                    org-refile-use-outline-path t
                    org-latex-create-formula-image-program 'dvisvgm
                    org-link-frame-setup '((file . find-file)))

              (setq org-clock-persist t)
              (org-clock-persistence-insinuate)

              (setq org-refile-use-outline-path 'file
                    org-outline-path-complete-in-steps nil)

              ;; This is needed as of Org 9.2
              (require 'org-tempo)
              (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
              (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
              (add-to-list 'org-structure-template-alist '("py" . "src python"))
              (add-to-list 'org-structure-template-alist '("js" . "src js"))
              (add-to-list 'org-structure-template-alist '("ts" . "src tsx-ts"))
              (add-to-list 'org-structure-template-alist '("ex" . "export"))
              (add-to-list 'org-structure-template-alist '("html" . "src html"))
              (add-to-list 'org-structure-template-alist '("hs" . "src haskell")))

(use-package! toc-org
              :after org
              :commands toc-org-enable
              :hook (org-mode . toc-org-enable))

(use-package! org-superstar
              :after org
              :hook (org-mode . (lambda () (org-superstar-mode 1)))
              :config
              (setq org-superstar-remove-leading-stars t
                    org-superstar-leading-bullet ?\s
                    org-superstar-leading-fallback ?\s
                    org-hide-leading-stars nil
                    org-superstar-special-todo-items nil
                    org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package! org-appear
              :hook (org-mode . org-appear-mode))

(use-package! org-auto-tangle
              :defer t
              :hook (org-mode . org-auto-tangle-mode)
              :config (setq org-auto-tangle-default nil)
              (defun clay-insert-auto-tangle-tag ()
                "Insert auto-tangle tag in literature config."
                (interactive)
                (evil-org-open-below 1)
                (insert "#+auto_tangle: t ")
                (evil-force-normal-state)))

(use-package! org-indent
              :remote (:type built-in)
              :config
              (custom-set-faces
               '(org-level-1 ((t (:inherit outline-1 :height 1.1))))
               '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
               '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
               '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
               '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
               '(org-level-6 ((t (:inherit outline-5 :height 1.1))))
               '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))
              (clay--org-setup-font-appearance))

(when clay-org-notify?
  (use-package! org-wild-notifier
                :after org
                :custom
                (alert-default-style 'libnotify)
                (org-wild-notifier-notification-title "Agenda Reminder")
                :config (org-wild-notifier-mode)))


(use-package! org-ref)
(use-package! gnuplot)

(when clay-org-pomodoro?
  (require 'clay-pomodoro))

(when clay-org-journal?
  (require 'clay-journal))

(when clay-use-evil?
  (require 'clay-org-evil))

(when clay-org-roam?
  (require 'clay-org-roam))

(provide 'clay-org)
;;; clay-org.el ends here
