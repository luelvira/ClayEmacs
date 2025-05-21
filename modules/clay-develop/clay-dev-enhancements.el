;;; clay-dev-enhancements.el --- Editor enhancements for dev modes  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

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

;; Allows fold the code
;; (use-package! origami :hook (prog-mode . origami-mode))
(use-package! hideshow :remote nil)
(use-package! evil-vimish-fold)
(use-package! ts-fold
              :remote (:host github :repo "emacs-tree-sitter/ts-fold"))


;; Select words based on the camelCase or snake_case style
(use-package! subword
  :remote nil
  :config (global-subword-mode 1))

;; smart indent. Detect the indent style and copy it
(use-package! dtrt-indent
  :ensure t
  :hook (prog-mode . dtrt-indent-mode)
  :config
  (setq dtrt-indent-verbosity 0))

(provide 'clay-dev-enhancements)
;;; clay-dev-enhancements.el ends here
