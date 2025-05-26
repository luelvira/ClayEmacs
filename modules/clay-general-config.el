;; clay-general-config.el -*- lexical-binding: t -*-

;; Define all the variables


(setq native-comp-async-report-warnings-errors nil)
;; Set the right directory to store the native comp cache
(add-to-list
  'native-comp-eln-load-path
  (expand-file-name "eln-cache/" user-emacs-directory))


(setq split-width-threshold 160
      split-height-threshold nil)

(setq find-file-visit-truename t
      vc-follow-symlinks t)

(setq tramp-default-method "ssh")

(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

(setq visible-bell t)

(setq indicate-buffer-boundaries nil
      indicate-empty-lines nil
      frame-title-format "%b - GNU Emacs"
      icon-title-format frame-title-format
      use-dialog-box nil
      window-divider-default-places       t
      window-divider-default-bottom-width 1
      window-divider-default-right-width  1
      display-time-format "%H:%M %a %d, %b"
      display-time-default-load-average nil)

(display-time-mode 1)

(setq ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)


(provide 'clay-general-config)
