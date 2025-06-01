;;; clay-dired.el --- dired but modern               -*- lexical-binding: t; -*-

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

;;;###autolad
(defun dired-do-flagged-delete-skip-trash ()
  "Permanentlyl delete the flagged for deletion in Dired.

This function temporarily sets `delete-by-moving-to-trash' to nil
and uses `dired-do-flagged-delete' to delete the files immediately."
  (interactive)
  (unless (derived-mode-p 'dired-mode)
    (user-error "This command is only available inside a Dired buffer"))
  (let ((delete-by-moving-to-trash nil))
    (dired-do-flagged-delete)))


(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "X") #'dired-do-flagged-delete-skip-trash))

(use-package! dirvish
  :after evil-collection
  :init
  ;; Activar dirvish sobre dired
  (dirvish-override-dired-mode)

  ;; Configuraciones similares a tu setup de dired
  (setq dired-dwim-target t
        dired-auto-revert-buffer #'dired-buffer-stale-p
        dired-recursive-copies  'always
        dired-recursive-deletes 'top
        dired-create-destination-dirs 'ask
        dired-listing-switches "--group-directories-first -alh")

  :config
  (setq dirvish-attributes '(file-size file-time collapse subtree-state)
        delete-by-moving-to-trash t)

  ;; Activar visual helpers
  (add-hook 'dirvish-directory-view-mode-hook #'hl-line-mode)

  ;; Integrar con peep-dired-like preview
  (setq dirvish-preview-dispatchers (list 'image 'archive 'pdf))

  ;; Custom keybindings al estilo evil
  (evil-collection-define-key 'normal 'dirvish-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file
    "y" 'dired-ranger-copy
    "X" 'dired-ranger-move
    "p" 'dired-ranger-paste
    "H" 'dired-omit-mode
    "C-j" 'dirvish-next-line
    "C-k" 'dirvish-previous-line))

;; Integración con extensiones de archivo (como dired-open)
(use-package! dired-open
  :after dired
  :config
  (setq dired-open-extensions
        '(("gif" . "sxiv")
          ("jpg" . "sxiv")
          ("mkv" . "mpv")
          ("mp4" . "mpv")
          ("pdf" . "firefox")
          ("png" . "sxiv"))))

(use-package! dired-collapse :after dired)
(use-package! dired-ranger   :after dired)

(provide 'clay-dired)
;;; clay-dired.el ends here
