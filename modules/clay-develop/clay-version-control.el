;;; clay-version-control.el --- Git and version control integration -*- lexical-binding: t; -*-

(use-package! transient
              :demand t
              :remote t
              ; :config (message "Ussing transient version: %s from %s" transient-version (find-library-name "transient"))
              )
(use-package! magit)

(use-package! diff-hl
              :unless is-termux
              :hook ((prog-mode . diff-hl-mode)
                     (text-mode . diff-hl-mode)
                     (dired-mode . diff-hl-dired-mode))
              :config
              (add-hook 'after-save-hook 'diff-hl-update)
              (diff-hl-flydiff-mode 1)
              (with-eval-after-load 'diff-hl
                                    (evil-define-key 'normal 'global
                                                     "]h" 'diff-hl-next-hunk
                                                     "[h" 'diff-hl-previous-hunk
                                                     "ghr" 'diff-hl-revert-hunk)))


(use-package! git-timemachine
              :after magit
              :hook (evil-normalize-keymaps . git-timemachine-hook)
              :config
              (evil-define-key 'normal git-timemachine-mode-map (kbd "C-j") 'git-timemachine-show-previous-revision)
              (evil-define-key 'normal git-timemachine-mode-map (kbd "C-k") 'git-timemachine-show-next-revision))

(use-package! git-commit
  :after magit
  :remote nil
  :preface
  (defun my/git-commit-auto-fill-everywhere ()
    "Ensure that the commit body does not exceed 72 characters."
    (setq fill-column 72)
    (setq-local comment-auto-fill-only-comments nil)
    (auto-fill-mode 1))
  :hook (git-commit-mode . my/git-commit-auto-fill-everywhere)
  :custom (git-commit-summary-max-length 50))


(defun clay-ediff-hook ()
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

(add-hook 'ediff-mode-hook 'clay-ediff-hook)


(defun clay-magit-diff-current-file ()
  "Show diff between the current file and its head state in Magit."
  (interactive)
  (if (and buffer-file-name (vc-backend buffer-file-name))
      (magit-diff-buffer-file)
    (error "This file is not in version control.")))



(provide 'clay-version-control)
