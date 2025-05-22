;; clay-nav.el -*- lexical-binding: t -*-
;; Navigation helpers and minibuffer enhancements.

(defun clay--interactive-find-file (dir)
  (let ((default-directory dir))
    (call-interactively 'find-file)))

(defun clay-go-dotfiles ()
  "Search files in the dotfiles directories set by `clay-dotfiles'."
  (interactive)
  (clay--interactive-find-file clay-dotfiles))

(defun clay-go-emacs-init ()
  "Open the init.el file from `private-emacs-directory'."
  (interactive)
  (find-file (expand-file-name "init.el" private-emacs-directory)))

(defun clay-go-emacs-modules ()
  "Search files in the modules directories in `private-emacs-directory'."
  (interactive)
  (clay--interactive-find-file (expand-file-name "modules/" private-emacs-directory)))

(defun clay-go-emacs-internal-modules ()
  "Search files in the lisp directories in `private-emacs-directory'."
  (interactive)
  (clay--interactive-find-file (expand-file-name "lisp/" private-emacs-directory)))

(defun clay-jump-dotfiles ()
  "Open dired inside `clay-dotfiles' folder."
  (interactive)
  (dired clay-dotfiles))

(defun clay-minibuffer-backward-kill (arg)
  "Delete backward in minibuffer intelligently.
If completing a file path, delete up to parent folder. Otherwise, delete ARG characters."
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
    (delete-backward-char arg)))

(defun clay-get-project-root ()
  "Return the current project root using Projectile, or nil if unavailable."
  (when (fboundp 'projectile-project-root)
    (projectile-project-root)))

(defun clay-consult-goto-line ()
  "Jump to a line using `consult-goto-line` with live preview."
  (interactive)
  (let ((consult-preview-key 'any))
    (consult-goto-line)))

(provide 'clay-nav)


