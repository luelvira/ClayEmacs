;;; clay-dev-treesitter.el --- Tree-sitter configuration and grammar setup -*- lexical-binding: t; -*-

(defcustom clay-use-native-treesit? nil
  "Non-nil to use the built-in module treesit, otherwise use the tree-sitter package."
  :group 'clay-dev
  :type 'bool)

(defun clay/reinstall-all-treesit-grammars ()
  "Force reinstall all grammars, even if already available."
  (interactive)
  (dolist (lang treesit-language-source-alist)
    (treesit-install-language-grammar (car lang))))

(use-package! treesit
  :remote (:type built-in) ;; built-in in recent Emacs
  :when (and
          clay-use-native-treesit?
          (fboundp 'treesit-available-p)
          (treesit-available-p))
  :init
  (defvar treesit-language-source-alist nil
    "Alist of Tree-sitter grammars to install.")
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
  ;; Remap classic major modes to Tree-sitter equivalents
  (dolist (mapping
            '(
               (bash-mode . bash-ts-mode)
               (c++-mode . c++-ts-mode)
               (c-mode . c-ts-mode)
               (c-or-c++-mode . c-or-c++-ts-mode)
               (css-mode . css-ts-mode)
               (js-json-mode . json-ts-mode)
               (js-mode . js-ts-mode)
               (js2-mode . javascript-ts-mode)
               (typescript-mode . typescript-ts-mode)
               (tsx-mode . tsx-ts-mode)
               (rjsx-mode . tsx-ts-mode)
               (json-mode . json-ts-mode)
               (sh-base-mode . bash-ts-mode)
               (sh-mode . bash-ts-mode)
               (python-mode . python-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))

  (defun clay-setup-install-grammars ()
    (interactive)
    (dolist (lang treesit-language-source-alist)
      (unless (treesit-language-available-p (car lang))
        (ignore-errors (treesit-install-language-grammar (car lang))))))
  ;; Install grammars on load
  (clay-setup-install-grammars))

(use-package! tree-sitter
  :hook (prog-mode . tree-sitter-mode)
  :disabled clay-use-native-treesit?
  :config
  (global-tree-sitter-mode))

(use-package! tree-sitter-langs
  :after tree-sitter
  :disabled clay-use-native-treesit?
  :config
  (tree-sitter-langs-install-grammars))

(use-package! evil-textobj-tree-sitter
              :when (and (not clay-use-native-treesit?) clay-use-evil?)
              :defer t
              :after tree-sitter)

(provide 'clay-dev-treesitter)
;;; clay-dev-treesitter.el ends here
