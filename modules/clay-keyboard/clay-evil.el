;;; clay-evil.el --- evil mode configuration     -*- lexical-binding: t; -*-

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

;; This file aims to provide the default configuration options for evil mode in Emacs.

;;; Code:

(defun enable-evil-pro-mode ()
  "Disable the arrow navigation."
  (dolist (key '("<left>" "<right>" "<down>" "<up>"))
    (define-key evil-visual-state-map (kbd key) 'rune/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd key) 'rune/dont-arrow-me-bro)
    (define-key evil-insert-state-map (kbd key) 'rune/dont-arrow-me-bro)))

(defun disable-evil-pro-mode ()
  "Restore the default values for the arrows keys."
  (define-key evil-normal-state-map (kbd "<left>")  'evil-backward-char)
  (define-key evil-normal-state-map (kbd "<right>") 'evil-forward-char)
  (define-key evil-normal-state-map (kbd "<up>")    'evil-previous-line)
  (define-key evil-normal-state-map (kbd "<down>")  'evil-next-line))


(global-set-key (kbd "C-M-u") 'universal-argument)

(use-package undo-tree
  :init (global-undo-tree-mode 1)
  :config
  (setq undo-tree-auto-save-history nil))

(defun rune/dont-arrow-me-bro ()
  "Show a message when the user try to use the arrow keys."
  (interactive)
  (message "Arrow keys are bad, you know?"))

(use-package evil
  :preface
  (setq evil-ex-search-vim-style-regexp t
        evil-ex-visual-char-range t  ; column range for ex commands
        evil-mode-line-format 'nil
        ;; more vim-like behavior
        evil-symbol-word-search t
        evil-ex-interactive-search-highlight 'selected-windowa)
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump t
        evil-undo-system 'undo-tree
        evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)
  ;; Set Emacs state modes
  (dolist (mode '(custom-mode
                  eshell-mode
                  git-rebase-mode
                  erc-mode
                  circe-server-mode
                  circe-chat-mode
                  circe-query-mode
                  term-mode))
    (add-to-list 'evil-emacs-state-modes mode))
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)
  ;;; Disable arrow keys in insert mode
  (unless is-termux
    (enable-evil-pro-mode)))

(use-package evil-collection
  :after evil
  :init
  (setq evil-collection-company-use-tng nil)  ;; Is this a bug in evil-collection?
  :custom
  (evil-collection-outline-bind-tab-p nil)
  :config
  (evil-collection-init))

(use-package evil-numbers
  :after evil
  :config
  (define-key evil-normal-state-map (kbd "g +") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "g -") 'evil-numbers/dec-at-pt)
  (define-key evil-visual-state-map (kbd "g +") 'evil-numbers/inc-at-pt-incremental)
  (define-key evil-visual-state-map (kbd "g -") 'evil-numbers/dec-at-pt-incremental))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-nerd-commenter
  :after evil
  :commands (evilnc-comment-operator
             evilnc-inner-comment
             evilnc-outer-commenter)
  :bind ([remap comment-line] . evilnc-comment-or-uncomment-lines)
  :config
  (define-key evil-normal-state-map (kbd "C-S-/") 'evilnc-comment-or-uncomment-lines))

(define-minor-mode evil-pro-mode
  "Minor mode to enable or disable the navigation throw the arrows key.
When the pro mode is enable, you can't navigate with these keys.
Enable it only for the most braves :;"
  :init-value t
  :lighter " evil-pro"
  :interactive t
  :group 'lem
  (if evil-pro-mode
      (enable-evil-pro-mode)
    (disable-evil-pro-mode)))

(use-package anzu)

(use-package evil-anzu
  :after evil
  :config (global-anzu-mode +1))


(provide 'clay-evil)
;;; clay-keyboard.el ends here
