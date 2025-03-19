;;; clay-java.el --- java development setup          -*- lexical-binding: t; -*-

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

;; 

;;; Code:

(defcustom lem/java-indentation-value 4
  "Default value of indentation for java mode."
  :set (lambda (k v)
         (set-default k v)
         (setq c-basic-offset k))
  :group 'lem
  :type 'number)

(use-package java-ts-mode
  :hook (java-mode . (lambda ()
                      (setq c-basic-offset lem/java-indentation-value)
                      (setq tab-width lem/java-indentation-value)
                      (setq indent-tabs-mode nil)
                      (subword-mode 1)))
  :config
  (add-to-list 'auto-mode-alist '("\\.java\\'" . java-ts-mode)))

(use-package maven-test-mode
  :ensure t
  :config
  (add-hook 'java-ts-mode-hook 'maven-test-mode))

(use-package compile
  :ensure nil
  :bind (:map java-ts-mode-map
              ("C-c m c" . (lambda ()
                             (interactive)
                             (compile "mvn compile")))
              ("C-c m t" . (lambda ()
                             (interactive)
                             (compile "mvn test")))))

(provide 'clay-java)
;;; clay-java.el ends here
