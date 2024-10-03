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

(defgroup lem-write ()
  "Lem group contains the default vars and function used in this module."
  :group 'lem
  :prefix "lem-write-")


(defun lem-write-text-mode-setup ()
  "Initialize the write mode."
  (interactive)
  (setq evil-auto-indent nil)
  (variable-pitch-mode 1)
  (auto-fill-mode 1))

(add-hook 'text-mode-hook 'lem-write-text-mode-setup)

(when clay-syntax?
  (require 'clay-syntax))
(use-package visual-fill-column)
(when clay-gmd?
  (require 'clay-markdown))
(when clay-latex?
  (require 'clay-latex))

(use-package ox-hugo
  :after ox)

(when clay-publish?
  (require 'clay-publish))

(defun lem-activate-ox-extra ()
  "Load the module ox-extra and activate it."
  (interactive)
  (require 'ox-extra)
  (setq org-latex-packages-alist 'nil
        org-latex-default-packages-alist
        '(("rm" "roboto"  t)
          ("defaultsans" "lato" t)
          ("" "paracol" t)
          )
        org-latex-with-hyperref t)
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))

(provide 'clay-write)
;;; clay-write.el ends here
