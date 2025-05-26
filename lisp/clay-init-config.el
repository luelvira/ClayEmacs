;;; clay-init-config.el --- setup package -*- lexical-binding: t -*-
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

;;; Code:

(defgroup clay nil
          "General customization options."
          :tag "Clay")

(defgroup clay-path '()
          "Customizations for Clay Emacs - Paths."
          :group 'clay
          :tag "Clay Path")

(defcustom clay-dotfiles nil
          "The path where the dotfiles git repo is stored."
           :type 'directory
           :group 'clay-path)

(defcustom clay-emacs-conf-directory nil
          "The path where the Emacs configuration is stored."
          :type 'directory
          :group 'clay-path)

(defcustom clay-git-dir nil
          "Path for the default git projects."
          :type 'directory
          :group 'clay-path)

(setq
  user-mail-address (string-trim (shell-command-to-string "git config --global user.email"))
  user-full-name (string-trim (shell-command-to-string "git config --global user.name"))
  user-name (getenv "USER"))


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

(defconst git-dir clay-git-dir
          "Path for the default git projects.")

(defconst lem/website_folder (expand-file-name "hugo_website" git-dir)
          "Path where I have the content of my personal web.")

(provide 'clay-init-config)
;;; init-consts.el ends here
