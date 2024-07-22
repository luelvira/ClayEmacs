;;; clay-develop.el --- Set up the IDE               -*- lexical-binding: t; -*-

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

;; This module provides some configuration that aims to help you while you are
;; writting code

;;; Code:

;; Allows fold the code
(use-package origami
  :hook (prog-mode . origami-mode))

;; Select words based on the camelCase or snake_case style
(use-package subword
  :config (global-subword-mode 1))

(when clay-python?
  (require 'clay-python))

(when clay-web?
  (require 'clay-web))

(when clay-haskell?
  (require 'clay-haskell))

(provide 'clay-develop)
;;; clay-develop.el ends here
