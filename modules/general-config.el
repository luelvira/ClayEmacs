;;; general-config.el --- Global configuration       -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Lucas Elvira Martín

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

;; This file initialize global configuration

;;; Code:
(eval-when-compile
  (require 'init-consts))

;; ResetVars
(setq backup-by-copying      t   ; instead of renaming current file (clobbers links)
      create-lockfiles       nil
      make-backup-files      t   ; Backup of a file the first time it is saved.
      backup-by-copying      t   ; Don't delink hardlinks
      version-control        t   ; Use version numbers on backups
      delete-old-versions    t   ; Automatically delete excess backups
      kept-new-versions      6   ; how many of the newest versions to keep
      kept-old-versions      5   ; and how many of the old
      auto-save-default      t
      ;; Don't auto-disable auto-save after deleting big chunks. This defeats
      ;; the purpose of a failsafe. This adds the risk of losing the data we
      ;; just deleted, but I believe that's VCS's jurisdiction, not ours.
      auto-save-include-big-deletions t
      require-final-newline           t)
;; -ResetVars

;; SudoEditPac
(use-package sudo-edit
  :commands (sudo-edit))
;; -SudoEditPac

;; DefBindings
;; Unbind unneeded keys
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "M-m") nil)
(global-set-key (kbd "C-x C-z") nil)
(global-set-key (kbd "M-/") nil)
;; -DefBindings

;; SetupCustomFile
(setq custom-file (expand-file-name "custom.el" private-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror 'nomessage))
;; -SetupCustomFile

;; NoLittering
(use-package no-littering
  :demand t
  :config
  (let ((backup-dir (no-littering-expand-var-file-name "backup/")))
    (make-directory backup-dir t)
    (setq backup-directory-alist
          `(("\\`/tmp/" . nil)
            ("\\`/dev/shm/" . nil)
            ("." . ,backup-dir)))))
;; NoLittering






(provide 'general-config)
;;; general-config.el ends here


