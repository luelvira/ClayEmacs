;;; clay-python.el --- Python configuration          -*- lexical-binding: t; -*-

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

;; Set up the python module

;;; Code:
(use-package python-mode
  :init
  (setq python-indent-guess-indent-offset t
        python-indent-guess-indent-offset-verbose nil
        python-shell-interpreter "python3"))

(use-package pyvenv
  :init (setenv "WORKON_HOME" "~/.pyenv/versions")
  :config
  (pyvenv-mode 1)
  (add-hook 'python-mode-local-vars-hook #'pyvenv-track-virtualenv)
  (add-to-list 'global-mode-string
               '(pyvenv-virtual-env-name (" venv:" pyvenv-virtual-env-name " "))
               'append))

(use-package lsp-pyright :ensure t)



(provide 'clay-python)
;;; clay-python.el ends here
