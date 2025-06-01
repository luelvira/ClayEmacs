;;; clay-persistence-config.el --- Your Emacs junk drawer, now organized—because even wizards need a tidy spellbook!  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

;; Author: Lucas Elvira Martín <lucaselvira96@gmail.com>

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



(provide 'clay-persistence-config)
;;; clay-persistence-config.el ends here



(setq backup-by-copying t ;; instead of renaming current file
      create-lockfiles nil
      make-backup-files t
      version-control t
      delete-old-versions  t
      kept-new-versions 6   ; how many of the newest versions to keep
      kept-old-versions 5
      ;; Autosave
      auto-save-default nil ;; Instruct auto-save-mode to save to the current file, not a backup file
      auto-save-include-big-deletions t
      auto-save-timeout 20       ; Number of seconds between auto-save
      auto-save-interval 200    ; Number of keystrokes between auto-saves

      )

(use-package! no-littering
              :demand t
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
              (setq backup-directory-alist
                    `(("\\`/tmp/" . nil)
                      ("\\`/dev/shm/" . nil)
                      ("." . ,(no-littering-expand-var-file-name "backup/"))))
              ; Prefix for generating auto-save-list-file-name
              (setq auto-save-list-file-prefix (no-littering-expand-var-file-name "auto-save-list/.saves-"))
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
                   history-delete-duplicates t
                   savehist-additional-variables '(kill-ring  ; persis clipboard
                                                   register-alist ; persis macros
                                                   mark-ring global-mark-ring
                                                   search-ring regexp-search-ring)) ;; persist search
             (savehist-mode 1))

(use-package! save-place
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

