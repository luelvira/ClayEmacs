;;; clay-vterm.el --- setup vterminal as default terminal emulator  -*- lexical-binding: t; -*-

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

;; 

;;; Code:


(use-package! vterm
  :commands vterm-mode
  :init
  (defun clay--vterm-disable-evil-mode ()
    "Disable evil-mode in vterm buffers."
    (evil-local-mode -1))
  :hook (vter-mode . clay--vterm-disable-evil-mode)
  :config
  (setq vterm-max-scrollback 10000
        vterm-kill-buffer-on-exit t))

(use-package! vterm-toggle
  :after vterm
  :config
  ;; When running programs in Vterm and in 'normal' mode, make sure that ESC
  ;; kills the program as it would in most standard terminal programs.
  (evil-define-key 'normal vterm-mode-map (kbd "<escape>") 'vterm--self-insert)
  (setq vterm-toggle-fullscreen-p nil)
  (setq vterm-toggle-scope 'project)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                     (let ((buffer (get-buffer buffer-or-name)))
                       (with-current-buffer buffer
                         (or (equal major-mode 'vterm-mode)
                             (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                  (display-buffer-reuse-window display-buffer-at-bottom)
                  ;;(display-buffer-reuse-window display-buffer-in-direction)
                  ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                  ;;(direction . bottom)
                  ;;(dedicated . t) ;dedicated is supported in emacs27
                  (reusable-frames . visible)
                  (window-height . 0.3))))

(use-package! multi-vterm :after vterm
  :init
  (defun clay--vterm-buffer-name ()
    "Return a vterm buffer name including project name."
    (let ((proj-name (when (fboundp 'projectile-project-name)
                       (projectile-project-name))))
      (if proj-name
          (format "*vterm: %s*" proj-name)
        "*vterm*")))
  :config
  (setq multi-vterm-buffer-name (clay--vterm-buffer-name)))

(provide 'clay-vterm)
;;; clay-vterm.el ends here
