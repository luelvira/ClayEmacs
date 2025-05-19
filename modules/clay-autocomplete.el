;;; clay-autocomplete.el --- Autocomplete system for ClayEmacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

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

;; This module configures a modern and extensible autocomplete system for ClayEmacs
;; using Corfu (Completion Overlay Region FUnction), Cape (Completion At Point
;; Extensions), Vertico (Vertical completion UI), Consult, Embark, Orderless,
;; and additional utilities.
;;
;; It enhances the completion experience in both regular buffers and the minibuffer,
;; offering contextual actions, rich annotations, flexible matching styles,
;; and user-friendly keybindings.

;;; Code:

(defgroup clay-autocomplete nil
  "Modern and modular autocomplete system for Clay Emacs."
  :group 'clay
  :tag "Clay Autocomplete"
  :prefix "clay-auto-")

(use-package! cape
  :after corfu
  :hook (eshell-mode . crafted-completion-corfu-eshell)
  :init
  ;; Add multiple completion-at-point backends.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)

  ;; No auto-completion or completion-on-quit in eshell
  (defun crafted-completion-corfu-eshell ()
    "Custom Corfu configuration for `eshell'.
Disables auto-completion and popups when typing in eshell."
    (setq-local corfu-quit-at-boundary t
                corfu-quit-no-match t
                corfu-auto nil)
    (corfu-mode)))

(use-package! corfu
  :bind (:map corfu-map
              ("C-j" . corfu-next)
              ("C-k" . corfu-previous)
              ("TAB" . corfu-insert))
  :custom
  (corfu-auto t)
  (corfu-preview-current nil)
  (corfu-quit-at-boundary t)
  (corfu-quit-no-match t)
  :init
  (global-corfu-mode)
  :config
  (setq corfu-cycle t
        corfu-auto-delay 0.24
        corfu-separator ?\s
        corfu-preselect-first nil
        corfu-preselect 'prompt
        tab-always-indent 'complete)


  (defun corfu-enable-in-minibuffer ()
    "Enable Corfu in the minibuffer if `completion-at-point' is bound."
    (when (where-is-internal #'completion-at-point (list (current-local-map)))
      (setq-local corfu-echo-delay nil ;; Disable automatic echo and popup
                  corfu-popupinfo-delay nil)
      (corfu-mode 1)))

  (add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer))

(defun clay-minibuffer-backward-kill (arg)
    "Delete up to the parent directory or previous word in minibuffer.
If the minibuffer contains a file path, delete the last segment.
Otherwise, delete the previous word or character depending on ARG.
Does not save to system clipboard."
  (interactive "p")
    (let ((kill-do-not-save-duplicates t)
        (interprogram-cut-function nil))
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
    (delete-backward-char arg))))

(use-package! vertico
  :custom (vertico-cycle t)
  :init (vertico-mode)
  :bind (:map vertico-map
              ("M-RET" . vertico-exit-input)
              ("C-j" . vertico-next)
              ("C-k" . vertico-previous)
              ("C-f" . vertico-exit)
              :map minibuffer-local-map ("M-<backspace>" . clay-minibuffer-backward-kill))
  :config
  (setq vertico-resize nil        ; How to resize the Vertico minibuffer window.
        vertico-count 8           ; Maximal number of candidates to show.
        vertico-count-format nil) ; No prefix with number of entries
  (setq-default completion-in-region-function
                (lambda (&rest args)
                  (apply (if vertico-mode
                             #'consult-completion-in-region
                           #'completion--in-region)
                         args))))

(defun clay-get-project-root ()
  (when (fboundp 'projectile-project-root)
    (projectile-project-root)))


(use-package! consult
  :demand t
  :bind
  ([remap bookmark-jump]                  . consult-bookmark)
  ([remap goto-line]                      . consult-goto-line)
  ([remap load-theme]                     . consult-theme)
  ([remap recentf-open-files]             . consult-recent-file)
  ([remap switch-to-buffer]               . consult-buffer)
  ([remap switch-to-buffer-other-window]  . consult-buffer-other-window)
  ([remap switch-to-buffer-other-frame]   . consult-buffer-other-frame)
  (("C-s"   . my/consult-line)
   ("C-M-l" . consult-imenu)
   ("C-M-j" . persp-switch-to-buffer*)
   :map minibuffer-local-map
   ("C-r"   . consult-history))
  :custom
  (consult-project-root-function #'clay-get-project-root)
  (completion-in-region-function #'consult-completion-in-region)
  :config
  (recentf-mode +1)
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file))

(defun my/consult-line ()
  "Search for a line in the current buffer with live preview."
  (interactive)
  (let ((consult-preview-key 'any)
        (mini-frame-resize 'grow-only)) ;; !! Important
    (consult-line)))

(defun my/consult-goto-line ()
  "Go to a specific line in the buffer with live preview."
  (interactive)
  (let ((consult-preview-key 'any))
    (consult-goto-line)))

(use-package! consult-dir
  :remote 
  :bind (([remap list-directory] . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file))
  :custom
  (consult-dir-project-list-function nil))


(use-package! consult-yasnippet
  :defer t
  :bind
  ([remap yas-insert-snippet] . consult-yasnippet))

(use-package! marginalia
  :after vertico
  :custom (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :hook (marginalia-mode . #'nerd-icons-completion-marginalia-setup)
  :config
  (setq-default marginalia--ellipsis "…"    ; Nicer ellipsis
                marginalia-align 'right     ; right alignment
                marginalia-align-offset -1) ; one space on the right
  :init
  (marginalia-mode))

(use-package! embark
  :config
  ;; Show Embark actions via which-key
  (setq embark-action-indicator
        (lambda (map)
          (which-key--show-keymap "Embark" map nil nil 'no-paging)
          #'which-key--hide-popup-ignore-command)
        embark-become-indicator embark-action-indicator)
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
  :bind
  (("C-;" . embark-act)))

(use-package! embark-consult
  :after embark)

;; (use-package! smex :config (smex-initialize))

(use-package! orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))


(provide 'clay-autocomplete)
;;; clay-autocomplete.el ends here
