;;; clay-sync.el --- Sync Git Projects -*- lexical-binding: t; -*-

;; Author: Lucas Elvira Martín
;; Description: Synchronize selected git repositories with upstream
;; Keywords: tools, git, convenience

;;; Commentary:


;;; Code:


(defun clay--sync (path)
  "Synchronize a single git repository located at PATH.
  - Commit local changes (if any) with timestamp.
  - Push or pull depending on sync status.
  - Show notification if there are divergences."
  (let* ((default-directory (file-name-as-directory (expand-file-name path)))
         (status (shell-command-to-string "git status --porcelain"))
         (commit-msg (format "Commit at %s from %s"
                             (format-time-string "%Y-%m-%d %H:%M:%S")
                             (system-name))))
    (message "[clay-sync] Syncing: %s" default-directory)
    (shell-command "git-fetch")
    (when (not (string-emty-p status))
      (shell-command "git add .")
      (shell-command (format "git commit -m \"%s\"" commit-msg)))

    (let ((local   (string-trim (shell-command-to-string "git rev-parse @")))
          (remote  (string-trim (shell-command-to-string "git rev-parse @{u}")))
          (base    (string-trim (shell-command-to-string "git merge-base @ @{u}")))
          (branch  (string-trim (shell-command-to-string
                                  "git branch --show-current"))))
      (cond
        ((string= local remote)
         (message "[clay-sync] Repo is up to date."))
        ((string= local base)
         (message "[clay-sync] Pulling remote changes...")
         (shell-command (format "git pull origin %s" branch)))
        ((string= remote base)
         (message "[clay-sync] Pushing local changes...")
         (shell-command (format "git push -u origin %s" branch)))
        (t
          (user-error "[clay-sync] Divergence detected. Please resolve manually."))))))

(defun clay-sync-org ()
  "Sync the Org directory with an external script."
  (interactive)
  (clay-sync org-directory))

(defun clay-sync-conf ()
  "Sync the config foler with an external script."
  (interactive)
  (clay-sync clay-dotfiles))

(defun clay-sync-emacs ()
  "Sync the emacs configuration."
  (interactive)
  (clay-sync clay-emacs-conf-directory))

(provide 'clay-sync)
