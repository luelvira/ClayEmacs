;;; clay-default-config.el; -*- lexical-binding: t -*-


;;; Startup behavior
(setq-default inhibit-startup-screen  t
              inhibit-startup-message t
              inhibit-startup-echo-area-message user-full-name
              require-final-newline           t)

;;; UTF-8 everywhere
(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
(prefer-coding-system       'utf-8)     ; Add utf-8 at the front for automatic detection.
(set-terminal-coding-system 'utf-8)     ; Set coding system of terminal output
(set-keyboard-coding-system 'utf-8)     ; Set coding system for keyboard input on TERMINAL
(set-language-environment "English")    ; Set up multilingual environment

;;; Basic behavior improvements
(setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
              confirm-nonexistent-file-or-buffer nil  ; Ok to visit non existent files
              confirm-kill-emacs #'y-or-n-p           ; Confirm before kill emacs

              ad-redefinition-action 'accept     ; Silence warnings for redefinition
              cursor-in-non-selected-windows nil ; Hide the cursor in inactive windows
              fill-column 80                     ; Default line width
              help-window-select t               ; Focus new help windows when opened
              indent-tabs-mode nil               ; space insetead of tabs
              tab-always-indent 'complete        ;first tab and then complete
              tab-width 4
              evil-shift-width tab-width
              inhibit-startup-screen t           ; Disable start-up screen
              sentence-end-double-space nil      ; Use a single space after dots
              truncate-string-ellipsis "…")

;;; Keyboard improvements
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; By default, Emacs requires you to hit ESC trhee times to escape quit the minibuffer
(global-set-key [escape] 'keyboard-escape-quit)

;;; UI defaults (unless in Termux)
(unless is-termux
  (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (fringe-mode nil)
  (tooltip-mode -1)
  (menu-bar-mode -1)
  (setq-default fringes-outside-margins t))

;; Line numbers
(setq-default display-line-numbers-width 0
              display-line-numbers-widen nil)
(column-number-mode 1)

(provide 'clay-default-config)
;;; clay-default-config-el ends here
