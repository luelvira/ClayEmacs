;;; clay-dev-treesitter.el --- Tree-sitter configuration and grammar setup  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

;; Author: Lucas Elvira Martín
;; Keywords: languages

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



(defcustom clay-use-native-treesit? nil
  "Non-nil to use the built-in module treesit, otherwise use the tree-sitter package."
  :type 'boolean
  :group 'clay-dev)

(use-package! treesit
  :remote (:type built-in) ;; built-in in recent Emacs
  :when (and
          clay-use-native-treesit?
          (fboundp 'treesit-available-p)
          (treesit-available-p))
  :preface
  (defun clay--treesit-map-repos ()
    "Setup the repositories where the grammar is available."
    (dolist (grammar
              '(
                 (bash "https://github.com/tree-sitter/tree-sitter-bash")
                 (c . ("https://github.com/tree-sitter/tree-sitter-c" "v0.23.3"))
                 (cmake "https://github.com/uyha/tree-sitter-cmake")
                 (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
                 (css "https://github.com/tree-sitter/tree-sitter-css")
                 (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile.git"))
                 (html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.20.1"))
                 (java . ("https://github.com/tree-sitter/tree-sitter-java" "v0.23.5"))
                 (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.21.2" "src"))
                 (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.20.2"))
                 (make "https://github.com/tree-sitter-grammars/tree-sitter-make")
                 (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.20.4"))
                 (toml "https://github.com/tree-sitter/tree-sitter-toml")
                 (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
                 (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
                 (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))
                 ))
      (add-to-list 'treesit-language-source-alist grammar)))
  (defun clay--treesit-map-classic-modes ()
    "mapping classic modes with their ts versions."
    (dolist (mapping
              '(
                 (bash-mode . bash-ts-mode)
                 (c++-mode . c++-ts-mode)
                 (c-mode . c-ts-mode)
                 (c-or-c++-mode . c-or-c++-ts-mode)
                 (cmake-mode . cmake-ts-mode)
                 (conf-toml-mode . toml-ts-mode)
                 (css-mode . css-ts-mode)
                 (dockerfile-mode . dockerfile-ts-mode)
                 (html-mode . html-ts-mode)
                 (javascript-mode . javascript-ts-mode)
                 (js-json-mode . json-ts-mode)
                 (js-mode . js-ts-mode)
                 (js2-mode . javascript-ts-mode)
                 (json-mode . json-ts-mode)
                 (json-mode . json-ts-mode)
                 (python-mode . python-ts-mode)
                 (rjsx-mode . tsx-ts-mode)
                 (sh-base-mode . bash-ts-mode)
                 (sh-mode . bash-ts-mode)
                 (toml-mode . toml-ts-mode)
                 (tsx-mode . tsx-ts-mode)
                 (typescript-mode . typescript-ts-mode)
                 (typescript-tsx-mode . tsx-ts-mode)
                 (yaml-mode . yaml-ts-mode)
                 ))
      (add-to-list 'major-mode-remap-alist mapping)))

  (defun clay--treesit-setup-install-grammars ()
    "Install treesit grammars when not available."
    (interactive)
    (dolist (lang treesit-language-source-alist)
      (unless (treesit-language-available-p (car lang))
        (treesit-install-language-grammar (car lang)))))
  :config
  
  (clay--treesit-map-repos)
  (clay--treesit-map-classic-modes)
  (clay--treesit-setup-install-grammars))

(use-package! tree-sitter
  :hook (prog-mode . tree-sitter-mode)
  :disabled clay-use-native-treesit?
  :config
  (global-tree-sitter-mode))

  (use-package! treesit-auto
    :custom
    (treesit-auto-install 'prompt)
    :config
    (treesit-auto-add-to-auto-mode-alist 'all)
    (global-treesit-auto-mode))

(use-package! evil-textobj-tree-sitter
              :when (and (not clay-use-native-treesit?) clay-use-evil?)
              :defer t
              :after tree-sitter)

(provide 'clay-dev-treesitter)
;;; clay-dev-treesitter.el ends here
