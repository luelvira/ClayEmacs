;; -*- lexical-binding: t -*-
;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
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

;; This file has been automatically generated. DO NOT EDIT.
;; Sources are available from https://github.com/luelvira/dotfiles/

;;; Code:

(eval-when-compile (require 'init-consts))

;; UnnecessaryUI
(unless is-termux
  (tool-bar-mode    -1)
  (scroll-bar-mode  -1)
  (set-fringe-mode   0)
  (tooltip-mode     -1)
  (menu-bar-mode    -1)
  (setq-default fringes-outside-margins t))
;; UnnecessaryUI

;; Reduce the clutter in the fringes; we'd like to reserve that space for more
(setq indicate-buffer-boundaries         nil
      indicate-empty-lines               nil
      frame-title-format                 "%b - GNU Emacs"
      icon-title-format                   frame-title-format
      use-dialog-box                      nil
      window-divider-default-places       t
      window-divider-default-bottom-width 1
      window-divider-default-right-width  1
      visible-bell                        t)

(add-hook 'emacs-startup-hook #'window-divider-mode)

; DisplayLines
(setq-default dispaly-line-numbers-width 3
              display-line-numbers-widen t)

(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))
; -DisplayLines

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (load-theme 'doom-dracula t))

(require 'hl-line)

(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'conf-mode-hook #'hl-line-mode)

(use-package rainbow-delimiters
  :init (setq rainbow-delimiters-max-face-count 4)
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

(use-package paren
  :config
  (setq show-paren-delay 0.1
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t)
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))
(provide 'init-theme)
;;; init-theme.el ends here
(require 'init-theme)
