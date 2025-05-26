;;; clay-version-control.el --- Git and version control integration  -*- lexical-binding: t; -*-

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



(use-package! transient
              :demand t
              :remote t)

(use-package! magit
              :remote t
              :config
              (defun my/git-commit-auto-fill-everywhere ()
                "Ensure that the commit body does not exceed 72 characters."
                (setq fill-column 72)
                (setq-local comment-auto-fill-only-comments nil)
                (auto-fill-mode 1))
              (require 'git-commit)
              (add-hook 'git-commit-mode-hook 'my/git-commit-auto-fill-everywhere)
              (setq git-commit-summary-max-length 50))

(use-package! diff-hl
  :unless is-termux
  :hook (((prog-mode conf-mode org-mode) . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode))
  :config
  (fringe-mode '4)
  (add-hook 'after-save-hook 'diff-hl-update)
  (custom-set-faces
   '(diff-hl-insert ((t (:inherit diff-added))))
   '(diff-hl-delete ((t (:inherit diff-removed))))
   '(diff-hl-change ((t (:inherit diff-changed)))))
  ;; (diff-hl-flydiff-mode 1)
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

(defun clay-ediff-hook ()
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

(add-hook 'ediff-mode-hook 'clay-ediff-hook)


(defun clay-magit-diff-current-file ()
  "Show diff between the current file and its head state in Magit."
  (interactive)
  (if (and buffer-file-name (vc-backend buffer-file-name))
      (magit-diff-buffer-file)
    (error "This file is not in version control")))

(provide 'clay-version-control)
;;; clay-version-control.el ends here
