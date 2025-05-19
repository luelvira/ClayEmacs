;; clayemacs.el --- set up emacs configuration -*- lexical-binding: t -*-
;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
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

;; This file has been automatically generated. DO NOT EDIT.
;; Sources are available from https://github.com/luelvira/dotfiles/

;;; Code:

(use-package! dashboard
  :disabled
  :diminish (dashboard-mode)
  :init      ;; tweak dashboard config before loading it
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))
        dashboard-banner-logo-title "Welcome to Emacs!"
        dashboard-set-navigator t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-startup-banner 'logo
        dashboard-center-content nil
        dashboard-items '((recents   . 5)
                          (agenda    . 5 )
                          (projects  . 5))
        dashboard-display-icons-p t ;; display icons on both GUI and terminal
        dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book"))))



(defgroup lem ()
  "Group for some personal variables."
  :prefix  'lem
  :version '0.0.1)

;;(defcustom lem/sync_script_path (let
;;  ((file-name (expand-file-name "sync.sh" "~/.local/bin/")))
;;  (if (file-exists-p file-name) file-name nil))
;;  "The path where the sync file is stored."
;;  :type 'string
;;  :group 'lem)

(electric-indent-mode -1)
(electric-pair-mode -1)

(add-hook 'emacs-startup-hook #'window-divider-mode)



(use-package! counsel-projectile
  :disabled
  :after projectile
  :bind (("C-M-p" . counsel-projectile-find-file))
  :config
  (counsel-projectile-mode))

;;(if (version< emacs-version "29.0")
;;  (use-package! seq))
;;(use-package! magit)

(defun auto-recompile-buffer ()
  (interactive)
  (if (member #'recompile after-save-hook)
      (remove-hook 'after-save-hook #'recompile t)
    (add-hook 'after-save-hook #'recompile nil t)))



(add-hook 'emacs-lisp-mode-hook  #'(lambda () (setq evil-shift-width 2)))



(defvar clay-syntax? t
  "Non-nil to load the syntax config.")
(defvar clay-gmd? t
  "Non-nil to load the markdown and  github markdown configuration.")
(defvar clay-latex? t
  "Non-nil to load the org-latex configuration.")

(defvar clay-publish? t
  "Non-nil to load the publish configuration.")

(defun zen-mode--activate ()
  "Function to active a free distraction mode."
  (setq visual-fill-column-width 100
        fill-column 80
        visual-fill-column-center-text t
        visual-fill-column-fringes-outside-margins t
        display-line-numbers nil)
  (auto-fill-mode -1)
  (git-gutter-mode -1)
  (visual-fill-column-mode 1))

(defun zen-mode--disable ()
  "Dsable the zen mode and restore the variables to the previous state."
  (visual-fill-column-mode -1)
  (auto-fill-mode 1)
  (kill-local-variable 'visual-fill-column-width)
  (kill-local-variable 'visual-fill-column-center-text)
  (kill-local-variable 'visual-fill-column-fringes-outside-margins)
  (kill-local-variable 'visual-fill-column-extra-text-width)
  (setq display-line-numbers t))

(defgroup zen ()
  "Group for the zen mode variables."
  :group 'lem-write
  :prefix 'zen)

(define-minor-mode zen-mode
  "Toggles local zen-mode."
  :initial nil
  :global nil
  :group 'zen-mode
  (if zen-mode
      (zen-mode--activate)
    (zen-mode--disable)))



(defconst lem/org-directory
  (concat (cond (is-debian "~/Sync/")
                (is-fedora "~/Sync/")
                (is-termux "~/storage/shared/Documents/")
		(is-work "~/Documents/")) "Org/"))


(setq org-roam-dailies-capture-templates
  '(("d" "default" entry "* %<%I:%M %p>:\n%?"
:if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+filetags: jouranl\n\n"))))


(defvar lem/bibliography-files (mapcar
   (lambda (file)
     (expand-file-name file lem/org-directory))
   '("bibliography.bib" "phd.bib")))

(provide 'clayemacs)
;;; clayemacs.el ends here
