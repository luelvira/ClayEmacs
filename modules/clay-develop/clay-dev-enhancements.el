;;; clay-dev-enhancements.el --- Editor enhancements for dev modes -*- lexical-binding: t; -*-

(dolist (mode '(text-mode-hook
                 prog-mode-hook
                 conf-mode-hook))
  (add-hook mode (lambda ()
                   (display-line-numbers-mode 1))))

(use-package! vi-tilde-fringe
              :remote (:host github :repo "syl20bnr/vi-tilde-fringe")
              :hook ((text-mode prog-mode conf-mode) . vi-tilde-fringe-mode))
              

;; Allows fold the code
;; (use-package! origami :hook (prog-mode . origami-mode))


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
