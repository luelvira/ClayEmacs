;;; clay-dired.el --- Dired configuration with Dirvish -*- lexical-binding: t; -*-
(use-package! dired
  :after evil-collection
  :remote nil
  :commands dired-jump
  :init
  (setq dired-dwim-target t  ; suggest a target for moving/copying intelligently
        ;; don't prompt to revert, just do it
        dired-auto-revert-buffer #'dired-buffer-stale-p
        ;; Always copy/delete recursively
        dired-recursive-copies  'always
        dired-recursive-deletes 'top
        ;; Ask whether destination dirs should get created when copying/removing files.
        dired-create-destination-dirs 'ask)

  :config
  (setq dired-listing-swithces "--group-directories-first"
        dired-omit-files "^\\.[^.].*"
        delete-by-moving-to-trash t)
  (autoload 'dired-omit-mode "dired-x")
  (add-hook 'dired-load-hook
            (lambda ()
              (interactive)
              (dired-collapse)))
  (add-hook 'dired-mode-hook
            (lambda () (interactive)
              (dired-omit-mode 1)
              (dired-hide-details-mode 1)
              (hl-line-mode 1))))

(use-package! dired-open
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("mkv" . "mpv")
                                ("mp4" . "mpv")
                                ("pdf" . "firefox")
                                ("png" . "sxiv"))))


(use-package! dired-ranger   :after dired)
(use-package! dired-collapse :after dired)

;; Dirvish: modern dired frontend with buffer reuse and previews
(use-package! dirvish
  :after dired
  :init
  (dirvish-override-dired-mode)
  :config
  (setq dirvish-attributes '(nerd-icons file-size subtree-state vc-state)
        dirvish-default-layout '(0 0.2 0.8)
        dirvish-mode-line-format '(:left (sort file-time symlink) :right (omit yank index))
        dirvish-header-line-height 20
        dirvish-use-header-line t
        dirvish-hide-details t
        delete-by-moving-to-trash t
        dirvish-preview-dispatchers
        '(dirvish-preview-image
          dirvish-preview-epub
          dirvish-preview-video
          dirvish-preview-pdf))
  (evil-collection-define-key 'normal 'dirvish-mode-map
    "h" 'dired-up-directory
    "l" 'dirvish-find-entry
    "H" 'dired-omit-mode
    "y" 'dired-ranger-copy
    "X" 'dired-ranger-move
    "p" 'dired-ranger-paste
    "q" 'dirvish-quit))

(provide 'clay-dired)
