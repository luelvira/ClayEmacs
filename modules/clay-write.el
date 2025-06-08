;;; clay-write.el --- clay-write                   -*- lexical-binding: t; -*-

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

;; Module used to manage the configuration needed for export org mode to different
;; environment

;;; Code:

(defgroup clay-write ()
  "Group contains the default vars and function used in this module."
  :group 'clay
  :prefix "clay-write-"
  :tag "Clay Write")

(defcustom clay-syntax? nil
  "Enable support for gramar and syntax configuration."
  :group 'clay-write
  :type 'boolean
  :set (lambda (k v)
         (set-default k v)
         (if v
           (require 'clay-syntax)
           (when (featurep 'clay-syntax)
           (unload-feature 'clay-syntax)))))

(defcustom clay-markdown? nil
  "Enable support for markdown mode."
  :group 'clay-write
  :type 'boolean
  :set (lambda (k v)
         (set-default k v)
         (if v
           (require 'clay-markdown)
           (when (featurep 'clay-markdown)
           (unload-feature 'clay-markdown)))))


(defcustom clay-latex? nil
  "Enable support for latex mode."
  :group 'clay-write
  :type 'boolean
  :set (lambda (k v)
         (set-default k v)
         (if v
           (require 'clay-latex)
           (when (featurep 'clay-latex)
           (unload-feature 'clay-latex)))))

(defcustom clay-publish? nil
  "Enable support for publish mode."
  :group 'clay-write
  :type 'boolean
  :set (lambda (k v)
         (set-default k v)
         (if v
           (require 'clay-publish)
           (when (featurep 'clay-publish)
           (unload-feature 'clay-publish)))))

(defun clay-write-text-mode-setup ()
  "Initialize the write mode."
  (interactive)
  (setq evil-auto-indent nil)
  (variable-pitch-mode 1)
  (auto-fill-mode 1))

(add-hook 'text-mode-hook 'clay-write-text-mode-setup)

(use-package! visual-fill-column)

(when clay-syntax?
  (require 'clay-syntax))
(when clay-markdown?
  (require 'clay-markdown))
(when clay-latex?
  (require 'clay-latex))

(use-package! ox-hugo
  :after ox)

(when clay-publish?
  (require 'clay-publish))

(defun clay-activate-ox-extra ()
  "Load the module ox-extra and activate it."
  (interactive)
  (require 'ox-extra)
  (setq org-latex-packages-alist 'nil
        org-latex-default-packages-alist
        '(("rm" "roboto"  t)
          ("defaultsans" "lato" t)
          ("" "paracol" t))
        org-latex-with-hyperref t)
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))

(provide 'clay-write)
;;; clay-write.el ends here
