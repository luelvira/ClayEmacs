;; -*- lexical-binding: t -*-
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

(eval-when-compile
  (require 'init-consts))

;; Group
(defgroup lem ()
  "Group for some personal variables."
  :prefix  'lem
  :version '0.1.0
  :group   'config)
;; -Group

;; DefineCustoms
(defcustom lem-alpha-value 90
  "The default value of transparency used for the current frame."
  :set (lambda (k v)
         (set-default k v)
         (when (fboundp 'lem-set-background) (lem-set-background)))
  :group 'lem
  :type '(number))

(defcustom lem/sync_script_path (let
  ((file-name (expand-file-name "sync.sh" "~/.local/bin/")))
  (if (file-exists-p file-name) file-name nil))
  "The path where the sync file is stored."
  :type 'string
  :group 'lem)

(defun lem-set-background ( &optional frame)
"Change the opactiy of the current FRAME with the value of lem-alpha-value."
  (unless is-termux
    (let ((alpha (if (boundp 'lem-alpha-value) lem-alpha-value 100)))
      (let ((tuple `(,alpha . ,alpha)))
        (set-frame-parameter frame 'alpha tuple)
        (add-to-list 'default-frame-alist `(alpha-background . ,lem-alpha-value))))))
(defun lem/sync (path)
  "Call the sync comand with the project to be syncrhonize.
PATH: is the dir where the git repo is"
  (shell-command-to-string (concat lem/sync_script_path " " path)))

(defun lem/sync-org ()
  "Sync the Org directory with an external script."
  (interactive)
  (lem/sync org-directory))

(defun lem/sync-conf ()
  "Sync the config foler with an external script."
  (interactive)
  (lem/sync lem/dotfiles))
;; FilesFunctions
(defun lem/delete-this-file ()
  "Delete the current file and kill the buffer."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename "?"))
            (progn (delete-file filename)
                   (message "File delete")
                   (kill-buffer)))
      (message "Not a file visiting buffer!"))))

(defun lem/rename-this-file ()
  "Rename the current file."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun lem/interactive-find-file (dir)
  "Use `find-file' interactively to search in the current directory.
DIR the current directory"
  (let ((default-directory dir))
    (call-interactively 'find-file)))

;; -FilesFunctions

;; ReloadFunction
(defun lem/reload-init-file ()
  "Reload the init file."
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))
;; -ReloadFunction

;; ConfigFunctions
(defun lem/go-dotfiles ()
  "Interactively navigate the dotfiles folder."
  (interactive)
  (lem/interactive-find-file lem/dotfiles))

(defun lem/go-emacs-config ()
  "Open the config.org file."
  (interactive)
  (find-file (expand-file-name "config/emacs/config.org" lem/dotfiles)))

(defun lem/go-emacs-init ()
  "Open the init file."
  (interactive)
  (find-file (expand-file-name "init.el" private-emacs-directory)))

(defun lem/go-emacs-modules ()
  "Navigate the modules folder."
  (interactive)
  (lem/interactive-find-file (expand-file-name "modules/" private-emacs-directory)))

(defun lem/jump-dotfiles ()
  "Open `dired' in the dotfiles folder."
  (interactive)
  (dired lem/dotfiles))
;; -ConfigFunctions

(defun lem/set--fonts ()
  "Function to setup the fonts once the frame is create.
This is required when using the daemon mode"
  (set-face-attribute 'default nil
                      :family lem-default
                      :width 'normal
                      :weight 'normal
                      :height 110)
  (set-face-attribute 'fixed-pitch nil
                      :inherit 'default
                      :weight 'medium
                      :height 1.0
                      :family lem-fixed)
  (set-face-attribute 'variable-pitch nil
                      :family  lem-variable
                      :inherit 'default
                      :weight 'regular))

(defun lem/set-fonts (frame)
  "Function to select the current FRAME when it is created.
Then call the set--fonts function."
  (select-frame frame)
  (lem/set--fonts))

(provide 'init-mode)
;;; init-mode.el ends here
