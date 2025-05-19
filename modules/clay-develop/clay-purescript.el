(use-package! purescript-mode
  :config
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
  (add-hook 'purescript-mode-hook 'flycheck-mode))

(use-package! psc-ide
  :hook (purescript-mode . psc-ide-mode)
  :config
  (remove-hook 'company-backends 'company-psc-ide-backend)
  (psc-ide-flycheck-setup))


(provide 'clay-purescript)
