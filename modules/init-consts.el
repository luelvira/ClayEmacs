;;; init-consts.el --- setup package -*- lexical-binding: t -*-
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

;; MachineInfo
(defconst is-termux
  (string-suffix-p "Android" (string-trim (shell-command-to-string "uname -a")))
  "Boolean variable to determinate if Emacs is runing into termux system.")

(defconst is-ubuntu
  (string= (system-name) "HP-Z1-G8")
  "Boolean variable to determinate if Emacs is runing on work's ubutnu machine.")

(defconst is-debian
  (string= (system-name) "debian")
  "Boolean variable to determinate if Emacs is runing on home's debian machine.")

(defconst is-fedora
  (string= (system-name) "fedora-laptop")
  "Boolean variable to determinate if Emacs is runing on laptop's fedora machine.")
;; -MachineInfo

;; UserInfo
(defvar user-name nil
  "The name to be used in message.")

(setq
  user-mail-address (string-trim (shell-command-to-string "git config --global user.email"))
  user-full-name (string-trim (shell-command-to-string "git config --global user.name"))
  user-name (getenv "USER"))
;; -UserInfo

;; Consts
(defconst lem/dotfiles "~/Documents/git/dotfiles/"
  "The path where the dotfiles git repo is stored.")

(defconst python-p
  (or (executable-find "python3")
      (and (executable-find "python")
           (> (length (shell-command-to-string "python --version | grep 'Python 3'")) 0)))
  "Do we have python3?")

(defconst pip-p
  (or (executable-find "pip3")
      (and (executable-find "pip")
           (> (length (shell-command-to-string "pip --version | grep 'python 3'")) 0)))
  "Do we have pip3?")
;; Consts

(provide 'init-consts)
;;; init-consts.el ends here
