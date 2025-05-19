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
  "non-nil to load and configure syntax checking."
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
  

;;;###autoload
(defun clay-dev--maybe-enable-diagnostics ()
  (unless (apply #'derived-mode-p clay-dev-diagnostic-disabled-modes)
    (if clay-dev-flymake?
        (when (fboundp 'flymake-mode)
        (flymake-mode 1))
      (when (fboundp 'flycheck-mode)
      (flycheck-mode 1)))))

(defun clay-dev--disable-legacy-flymake ()
  (when (member #'flymake-proc-legacy-flymake flymake-diagnostic-functions)
    (remove-hook 'flymake-diagnostic-functions #'flymake-proc-legacy-flymake t)))

;;(use-package! prog-mode
;;              :hook (prog-mode . clay-dev--maybe-enable-diagnostics)
;;              :remote nil)

(use-package! project :remote t) ;; There is an error with eglot and project https://emacs.stackexchange.com/a/81908

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
              :remote (:host github :repo "emacs-straight/flymake")
              :hook ((prog-mode . clay-dev--maybe-enable-diagnostics)
                     (text-mode . clay-dev--maybe-enable-diagnostics)
                     (flymake-mode . clay-dev--disable-legacy-flymake))
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

(provide 'clay-dev-core)
;;; clay-dev-core.el ends here
