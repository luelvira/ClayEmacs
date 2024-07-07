;;; init-package.el --- boostrap straight            -*- lexical-binding: t; -*-

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

;; 

;;; Code:

(if (eq system-type 'gnu/linux)
    ;; Straight
    (progn
      (setq straight-check-for-modifications nil)
      (defvar bootstrap-version)
      (let ((bootstrap-file
             (expand-file-name
              "straight/repos/straight.el/bootstrap.el"
              (or (bound-and-true-p straight-base-dir)
                  user-emacs-directory)))
            (bootstrap-version 7))
        (unless (file-exists-p bootstrap-file)
          (with-current-buffer
              (url-retrieve-synchronously
               "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
               'silent 'inhibit-cookies)
            (goto-char (point-max))
            (eval-print-last-sexp)))
        (load bootstrap-file nil 'nomessage))

      ;; Use straight by default
      (straight-use-package 'use-package)
      (setq straight-use-package-by-default t))
  ;; -Straight

  (progn
    ;; DefaultPackageManagement
    (setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
          package-archives
          '(("gnu" . "https://elpa.gnu.org/packages/")
            ("melpa" . "https://melpa.org/packages/")))
    ;; -DefaultPackageManagement
    ;; UsePackage
    ;; Install use-package if not installed
    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))

    (eval-and-compile
      (setq use-package-always-ensure t)
      (setq use-package-expand-minimally t)
      (setq use-package-compute-statistics t)
      (setq use-package-enable-imenu-support t))

    (eval-when-compile
      (require 'use-package)
      (require 'bind-key))
    ;; -UsePackage
    ))


(provide 'init-package)
;;; init-package.el ends here
