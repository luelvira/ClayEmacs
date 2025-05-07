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

;; smart indent. Detect the indent style and copy it
(use-package dtrt-indent
  :ensure t
  :hook (prog-mode . dtrt-indent-mode)
  :config
  (setq dtrt-indent-verbosity 0))

(use-package treesit
  :straight nil
  :when (and (fboundp 'treesit-available-p) (treesit-available-p))
  :init
  (defvar treesit-language-source-alist nil)
  (setq treesit-language-source-alist
           '(
             (bash "https://github.com/tree-sitter/tree-sitter-bash")
             (c "https://github.com/tree-sitter/tree-sitter-c")
             (cmake "https://github.com/uyha/tree-sitter-cmake")
             (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
             (css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.20.0"))
             (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile.git"))
             (elisp "https://github.com/Wilfred/tree-sitter-elisp")
             (html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.20.1"))
             (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.21.2" "src"))
             (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.20.2"))
             (make "https://github.com/alemuller/tree-sitter-make")
             (markdown "https://github.com/ikatyang/tree-sitter-markdown")
             (prisma "https://github.com/victorhqc/tree-sitter-prisma")
             (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.20.4"))
             (toml "https://github.com/tree-sitter/tree-sitter-toml")
             (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
             (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
             (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))))
    :config
    (dolist (mapping
             '(
               (bash-mode . bash-ts-mode)
               (c++-mode . c++-ts-mode)
               (c-mode . c-ts-mode)
               (c-or-c++-mode . c-or-c++-ts-mode)
               (css-mode . css-ts-mode)
               (css-mode . css-ts-mode)
               (js-json-mode . json-ts-mode)
               (js-mode . typescript-ts-mode)
               (js2-mode . js-ts-mode)
               (json-mode . json-ts-mode)
               (sh-base-mode . bash-ts-mode)
               (sh-mode . bash-ts-mode)
               (typescript-mode . typescript-ts-mode)
               (python-mode . python-ts-mode)
               ))
      (add-to-list 'major-mode-remap-alist mapping))
    (defun os/setup-install-grammars ()
      (interactive)
      (dolist (lang treesit-language-source-alist)
        (unless (treesit-language-available-p (car lang))
          (treesit-install-language-grammar (car lang)))))
    (os/setup-install-grammars))

(when clay-python?
  (require 'clay-python))

(when clay-web?
  (require 'clay-web))

(when clay-haskell?
  (require 'clay-haskell))

(when clay-java?
  (require 'clay-java))

(require 'clay-uml)

(provide 'clay-develop)
;;; clay-develop.el ends here
