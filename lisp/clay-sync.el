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
  (unless (file-directory-p path)
    (user-error "[clay-sync] Error: '%s' is not a valid directory" path))
  (let* ((default-directory (file-name-as-directory (expand-file-name path)))
         (output-buffer (get-buffer-create "*clay-sync*"))
         (status (shell-command-to-string "git status --porcelain"))
         (commit-msg (format "Commit at %s from %s"
                             (format-time-string "%Y-%m-%d %H:%M:%S")
                             (system-name))))
    (with-current-buffer output-buffer
      (goto-char (point-max))
      (insert (format "\n[clay-sync] Syncing: %s" default-directory))
      (insert "\n" status "\n"))
    
    (shell-command "git fetch" output-buffer)
    (unless (string-empty-p status)
      (shell-command "git add ." output-buffer)
      (shell-command (format "git commit -m \"%s\"" commit-msg) output-buffer))

    (let ((local   (string-trim (shell-command-to-string "git rev-parse @")))
          (remote  (string-trim (shell-command-to-string "git rev-parse @{u}")))
          (base    (string-trim (shell-command-to-string "git merge-base @ @{u}")))
          (branch  (string-trim (shell-command-to-string "git branch --show-current"))))
      (cond
       ((string= local remote)
        (with-current-buffer output-buffer
          (insert "[clay-sync] Repo is up to date.\n")))
       ((string= local base)
        (with-current-buffer output-buffer (insert "[clay-sync] Pulling remote changes...\n"))
        (shell-command (format "git pull origin %s" branch) output-buffer))
       ((string= remote base)
        (with-current-buffer output-buffer (insert "[clay-sync] Pushing local changes...\n"))
        (shell-command (format "git push -u origin %s" branch) output-buffer))
       (t
        (with-current-buffer output-buffer
          (insert "[clay-sync] Divergence detected. Please resolve manually\n"))
        (user-error "[clay-sync] Divergence detected. Please resolve manually"))))))

(defun clay-sync-org ()
  "Sync the Org directory with an external script."
  (interactive)
  (clay--sync clay-org-directory))

(defun clay-sync-conf ()
  "Sync the config foler with an external script."
  (interactive)
  (clay--sync clay-dotfiles))

(defun clay--sync-emacs ()
  "Sync the Emacs configuration."
  (interactive)
  (clay--sync clay-emacs-conf-directory))

(clay-map!
 "s" '(:ignore t       :which-key "Sync")
 "so" '(clay-sync-org  :which-key "Sync org files")
 "sc" '(clay-sync-conf :which-key "Sync config folder"))

(provide 'clay-sync)
;;; clay-sync.el ends here
