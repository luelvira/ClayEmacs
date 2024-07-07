;;; init.el --- inti file for my custom configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Lucas Elvira Martin

;; Author: Lucas Elvira Martin <lucas@debian>
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

;; This is the init file for my own configuration

;;; Code:
;; BetterGc
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold (* 2 1024 1024)
          file-name-handler-alist file-name-handler-alist-original)
    (makunbound 'file-name-handler-alist-original)
      (message "*** Emacs loaded in %s seconds with %d garbage collections."
        (emacs-init-time "%.2f") gcs-done)))
;; -BetterGc


;; LoadPath
(defun update-to-load-path (folder)
  "Update FOLDER and its subdirectories to `load-path'."
  (let ((base folder))
    (unless (member base load-path)
      (add-to-list 'load-path base))
    (dolist (f (directory-files base))
      (let ((name (concat base "/" f)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (unless (member base load-path)
            (add-to-list 'load-path name)))))))

(update-to-load-path (expand-file-name "modules" private-emacs-directory))
;; -LoadPath

(require 'init-consts)
(require 'init-package)
(require 'general-config)

(provide 'init)
;;; init.el ends here
