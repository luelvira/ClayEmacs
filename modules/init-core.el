;;; module/init-core.el --- setup default configuration -*- lexical-binding: t -*-
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
(require 'savehist)
(require 'server)


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

;; DefaultEncoding
;; Set encding by default
(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
(prefer-coding-system       'utf-8)     ; Add utf-8 at the front for automatic detection.
(set-terminal-coding-system 'utf-8)     ; Set coding system of terminal output
(set-keyboard-coding-system 'utf-8)     ; Set coding system for keyboard input on TERMINAL
(set-language-environment "English")    ; Set up multilingual environment
;; -DefaultEncoding

;; DisableWarning
(setq native-comp-async-report-warnings-errors nil)
;; Set the right directory to store the native comp cache
(add-to-list
  'native-comp-eln-load-path
  (expand-file-name "eln-cache/" user-emacs-directory))
;; -DisableWarning

(savehist-mode 1)
;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

(let (message-log-max)
  (savehist-mode))

(setq
  ;; ResetVars
  backup-by-copying      t   ; instead of renaming current file (clobbers links)
  create-lockfiles       nil
  make-backup-files      t   ; Backup of a file the first time it is saved.
  backup-by-copying      t   ; Don't delink hardlinks
  version-control        t   ; Use version numbers on backups
  delete-old-versions    t   ; Automatically delete excess backups
  kept-new-versions      6   ; how many of the newest versions to keep
  kept-old-versions      5   ; and how many of the old
  auto-save-default      t
  require-final-newline  t
  auto-save-include-big-deletions t
  ;; -ResetVars
  ;; Recovery
  auto-save-list-file-prefix (expand-file-name ".auto-save-list/.saves-" user-emacs-directory)
  auto-save-default t        ; Auto-save every buffer that visits a file
  auto-save-timeout 20       ; Number of seconds between auto-save
  auto-save-interval 200     ; Number of keystrokes between auto-saves
  ;; -Recovery
  history-length 25
  history-delete-duplicates t
  ;; SplitConfig
  split-width-threshold 160
  split-height-threshold nil
  ;; -SplitConfig
  ;; FollowLinks
  find-file-visit-truename t
  vc-follow-symlinks t
  ;; -FollowLinks
  ;; tramp
  tramp-default-method "ssh"
  ;; -tramp
  ;; Bookmarks
  bookmark-default-file (expand-file-name "bookmarks" user-emacs-directory)
  ;; -Bookmarks
)

(setq-default
  use-short-answers t                     ; Replace yes/no prompts with y/n
  confirm-nonexistent-file-or-buffer nil  ; Ok to visit non existent files
  confirm-kill-emacs #'y-or-n-p           ; Confirm before kill emacs
  ad-redefinition-action 'accept          ; Silence warnings for redefinition
  cursor-in-non-selected-windows nil      ; Hide the cursor in inactive windows
  fill-column 80                          ; Default line width
  help-window-select t                    ; Focus new help windows when opened
  indent-tabs-mode nil                    ; space insetead of tabs
  tab-always-indent 'complete             ; first tab and then complete
  tab-width 4
  evil-shift-width tab-width
  inhibit-startup-screen t                ; Disable start-up screen
  sentence-end-double-space nil           ; Use a single space after dots
  truncate-string-ellipsis "…")

;; EmacsServer
(unless (or is-termux
            (server-running-p))
  (server-start))
;; -EmacsServer

;; Autorevert
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)
;; -Autorevert

;; UseEscape
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; By default, Emacs requires you to hit ESC trhee times to escape quit the minibuffer
(global-set-key [escape] 'keyboard-escape-quit)
;; UseEscape

(provide 'init-core)
;;; init-core.el ends here
