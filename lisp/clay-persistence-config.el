;;; clay-littering-config.el -*- lexical-binding: t; -*-
(use-package! no-littering
              :remote t
              :init
              (setq no-littering-etc-directory (expand-file-name "etc/" user-emacs-directory)
                    no-littering-var-directory (expand-file-name "var/" user-emacs-directory))
              (dolist (dir `(
                             ,no-littering-etc-directory
                             ,no-littering-var-directory
                             ,(no-littering-expand-var-file-name "backup/")
                             ,(no-littering-expand-var-file-name "auto-save")))
                (unless (file-directory-p dir)
                  (make-directory dir t)))
              :config
              ;; Backups
              (setq backup-by-copying t ;; instead of renaming current file
                    make-backup-files nil
                    version-control t 
                    delete-old-versions  t
                    kept-new-versions 6   ; how many of the newest versions to keep
                    kept-old-versions 5
                    create-lockfiles nil
                    backup-directory-alist
                    `(("\\`/tmp/" . nil)
                      ("\\`/dev/shm/" . nil)
                      ("." . ,(no-littering-expand-var-file-name "backup/"))))
              ;; Autosave
              (setq auto-save-default nil ;; Instruct auto-save-mode to save to the current file, not a backup file
                    auto-save-include-big-deletions t
                    auto-save-timeout 20       ; Number of seconds between auto-save
                    auto-save-interval 200    ; Number of keystrokes between auto-saves
                    ; Prefix for generating auto-save-list-file-name
                    auto-save-list-file-prefix (no-littering-expand-var-file-name "auto-save-list/.saves-"))
              (setq-default auto-save-default nil)
              ;; Bookmark
              (setq bookmark-default-file (no-littering-expand-var-file-name "bookmarks"))
              ;; remote conexions
              (setq tramp-persistency-file-name (no-littering-expand-var-file-name "tramp")))


(use-package! savehist
             :after no-littering
             :remote nil
             :init
             (setq savehist-file (no-littering-expand-var-file-name "savehist"))
             :config
             (setq history-length 25
                   history-delete-duplicates t)
             (savehist-mode 1))

(use-package! saveplace
             :after no-littering
             :remote nil
             :config
             (setq save-place-file (no-littering-expand-var-file-name "places"))
             (save-place-mode 1))

(use-package! recentf
             :after no-littering
             :remote nil
             :init
              (setq recentf-save-file (no-littering-expand-var-file-name "recentf"))
            :config
            (recentf-mode 1))


;;;###autoload
(defun clay-open-var-directory ()
  "Open var directory management by no-littering."
  (interactive)
  (dired no-littering-var-directory))

;;;###autoload
(defun clay-open-etc-directory ()
  "Open etc directory management by no-littering."
  (interactive)
  (dired no-littering-etc-directory))

;;;###autoload
(defun clay-clear-var-directory (&optional confirm)
  "Delete all files in the no-littering var/ directories."
  (interactove "p")
  (when (or (not confirm)
            (yes-or-no-p (format "Are you sure you want to clean all persistent data files in %s?" no-littering-var-directory)))
     (let ((dirs (list no-littering-var-directory))
  (deleted 0))
      (dolist (dir dirs)
        (when (file-directory-p dir)
          (dolist (file (directory-files-recursively dir ".*" nil))
            (when (file-regular-p file)
              (delete-file file)
              (setq deleted (1+ deleted))))))
      (when (called-interactively-p 'interactive)
        (message "Deleted %d persistent file(s) from %s." deleted no-littering-var-directory)))))


(provide 'clay-persistence-config)

