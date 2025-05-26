;;; clay-dev-lsp.el --- configure lsp client with eglot  -*- lexical-binding: t; -*-

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

(use-package! eglot
  :remote (:type built-in)
  :commands eglot eglot-ensure
  :init
  (setq eglot-sync-connect 1
        eglot-auto-display-help-buffer nil
        eldoc-echo-area-use-multiline-p t
        eglot-autoshutdown t)
  (setq-default eglot-workspace-configuration
                '((haskell
                   (plugin
                    (stan
                     (globalOn . :json-false))))))
  :hook(
        ((python-mode python-ts-mode) . eglot-ensure)
        (web-mode . eglot-ensure)
        ((typescript-mode typescript-mode) . eglot-ensure)
        (js2-mode . eglot-ensure)
        ((tsx-mode-mode tsx-ts-mode-mode) . eglot-ensure)
        (haskell-mode . eglot-ensure)
        (eglot-managed-mode . clay/eglot-disable-flymake-legacy-backend)))

(defun clay/eglot-disable-flymake-legacy-backend ()
  "Disable `flymake-proc-legacy-flymake' when eglot is active."
  (when (bound-and-true-p flymake-mode)
    (setq-local flymake-diagnostic-funcions
                (remove #'flymake-proc-legacy-flymake flymake-diagnostic-functions))
    (flymake-start)))


(use-package! consult-eglot :defer t)

(defun clay/eglot-doc-embark-action (identifier)
  "Show documentation for IDENTIFIER using Eglot."
  (when (eglot-managed-p)
    (let ((thing (thing-at-point 'symbol t)))
      (when thing
        (eldoc-doc-buffer)))))

(with-eval-after-load 'embark
  (add-to-list 'embark-target-finders
               '(clay-symbol-at-point
                 . (lambda () (when-let ((s (thing-at-point 'symbol t)))
                                `(symbol ,s)))))
  (add-to-list 'embark-keymap-alist
               '(symbol . clay-eglot-symbol-map)))

(defvar clay-eglot-symbol-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "d") #'eldoc-doc-buffer)
    map)
  "Embark keymap for symbols in Eglot.")


;; (use-package! flycheck-eglot :hook (eglot-managed-mode . flycheck-eglot-mode))

(provide 'clay-dev-lsp)
;;; clay-dev-lsp.el ends here
