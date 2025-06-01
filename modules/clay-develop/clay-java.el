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

(defun clay-java-style-setup ()
  "Custom Java coding style according to community standards."
  (message "> clay-java-style-setup called")
  (c-set-style "java")
  (setq c-basic-offset lem/java-indentation-value
        tab-width lem/java-indentation-value
        indent-tabs-mode nil)
  (c-set-offset 'arglist-intro '++)
  (c-set-offset 'arglist-cont-nonempty '++)
  (c-set-offset 'arglist-cont '++)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'statement-cont '++)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'topmost-intro-cont '+)
  (subword-mode 1))

(use-package! java-mode
  :remote nil
  :mode "\\.java\\'"
  :hook (java-mode . clay-java-style-setup))


(use-package! maven-test-mode
  :ensure t
  :config
  (add-hook 'java-ts-mode-hook 'maven-test-mode))

;;(use-package! compile
;;  :ensure nil
;;  :bind (:map java-ts-mode-map
;;              ("C-c m c" . (lambda ()
;;                             (interactive)
;;                             (compile "mvn compile")))
;;              ("C-c m t" . (lambda ()
;;                             (interactive)
;;                             (compile "mvn test")))))

(provide 'clay-java)
;;; clay-java.el ends here
