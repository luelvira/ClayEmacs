;;; clay-system.el --- module to detect current machine  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

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

;; This module will check for the current uname of the machine, or the
;; system-name. Some configurations are systems dependents.

;;; Code:

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

(defconst is-work
          (or
  	        (string= (system-name) "baco.diatel.upm.es")
	        (string= (system-name) "fedora"))
          "Boolean variable to determinate if Emacs is runing on laptop's working machine.")


(provide 'clay-system)
;;; clay-system.el ends here
