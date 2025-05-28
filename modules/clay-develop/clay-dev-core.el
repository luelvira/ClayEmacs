;;; clay-dev-core.el --- configure core modules for developing  -*- lexical-binding: t; -*-

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


;;; Code:

(defcustom clay-dev-check-syntax? t
  "Non-nil to load and configure syntax checking."
  :type 'boolean
  :group 'clay-dev)

(defcustom clay-dev-disable-diagnostics-in-temporary-buffers t
  "Whether to disable Flycheck and Flymake in temporary or special-purpose buffers.
This includes buffers not visiting a file, or buffers whose names match entries in
`clay/dev-diagnostics-disabled-buffer-names'."
  :type 'boolean
  :group 'clay-dev)

(defcustom clay-dev-diagnostic-disabled-modes '(emacs-lisp-mode)
  "List of modes where flymake/flycheck should not be activate."
  :type '(repeat symbol)
  :group 'clay-dev)

(defcustom clay-dev-flymake? t
  "Whether to use flymake or flycheck in case of diagnostic is active."
  :type 'boolean
  :group 'clay-dev)

(if (eq clay-preferred-package-manager 'elpaca)
  ;; https://github.com/progfolio/elpaca/issues/398
  (progn
    (unload-feature 'eldoc t)
    (setq custom-delayed-init-variables '())
    (defvar global-eldoc-mode nil)
    (elpaca eldoc
            (require 'eldoc)
            (global-eldoc-mode))
    (use-package! jsonrpc :remote (:wait t))
    (use-package! xref :remote t))
  (use-package! eldoc
                :remote (:type built-in)
                :hook (eglot-managed-mode . eldoc-mode)
                :custom
                (eldoc-echo-area-use-multiline-p nil)))


;; There is an error with eglot and project
;; https://emacs.stackexchange.com/a/81908
(use-package! project :remote (:type built-in))

(use-package! projectile
  :remote t
  :init
  (setq projectile-auto-discover nil
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
        projectile-kill-buffers-filter 'kill-only-files)
  :diminish projectile-mode
  :config (projectile-mode +1))

(use-package! compile
              :remote nil
              :custom
              (compilation-scroll-output t))

(use-package! flycheck
              :if (and clay-dev-check-syntax? (not clay-dev-flymake?))
              :remote t
              :diminish)

(use-package! flymake
              :if (and clay-dev-check-syntax? clay-dev-flymake?)
              ; :remote (:host github :repo "emacs-straight/flymake")
              :remote (:type built-in)
              :hook ((prog-mode text-mode) . flymake-mode)
              :config
              (setq flymake-fringe-indicator-position 'right-fringe))

              
(use-package! yasnippet
              :defer t
              :config
              (delq 'yas-dropdown-prompt yas-prompt-functions)
              (yas-global-mode 1))

(use-package! yasnippet-snippets)

(use-package! doom-snippets
              :disabled t
              :after yasnippet
              :remote (doom-snippets :type git :host github :repo "doomemacs/snippets" :files ("*.el" "*"))
              :config (add-to-list 'yas-snippet-dirs
                                   (expand-file-name "snippets"  (file-name-directory (locate-library "doom-snippets"))))
              (yas-reload-all))


(use-package! wakatime-mode
              :disabled (not is-debian)
              :remote t
              :config
              (global-wakatime-mode))

(use-package! activity-watch-mode
              :disabled (not is-debian)
              :remote t
              :config
              (global-activity-watch-mode))

(use-package! consult-dash
              :commands consult-dash
              :init
              (setq consult-dash-docsets-dir "~/.local/share/Zeal/Zeal/docsets"
                    consult-dash-browser-func #'browse-url))


;;;###autoload
(defun clay-set-docsets (mode &rest docsets)
  "Asociate DOCSETS to a major MODE for `consult-dash'."
  (add-hook (intern (format "%s-hook" mode))
            (lambda ()
              (setq-local consult-dash-docsets docsets))))

(use-package! rainbow-delimiters)

(provide 'clay-dev-core)
;;; clay-dev-core.el ends here
