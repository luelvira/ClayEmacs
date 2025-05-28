;;; clay-javascript.el --- For those who dream in camelCase and live in async/await  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

;; Author: Lucas Elvira Martín <lucaselvira96@gmail.com>
;; Keywords: languages

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


(defcustom clay-js-indentation-value 2
  "The default value for indent javascript and typescript files."
  :set (lambda (k v)
         (when (fboundp 'lem/js-indentation)
           (if (cl-oddp v)
               (user-error "Indentation must be even")
             (progn
               (set-default k v)
               (clay-update-js-indentation)))))
  :group 'clay-dev
  :type 'number)

(defun clay-update-js-indentation ()
  "Setup the default indent for javascript files."
  (interactive)
  (setq js-chain-indent         t
        js-indent-level         clay-js-indentation-value
        js2-basic-offset        js-indent-level
        typescript-indent-level js-indent-level
        evil-shift-width        js-indent-level
        tab-width               js-indent-level))


(defun clay--enable-docsets (packages)
  "Iterate over a list of PACKAGES and configure docsets for them.

Each element can be a symbol, when mode and package are equals, or a cons cell (MODE . PACKAGE)"
  (dolist (entry packages)
    (let ((mode (if (consp entry) (car entry) entry))
          (package (if (consp entry) (cdr entry) entry)))
    (with-eval-after-load package
      (clay-set-docsets mode "CoffeeScript" "D3JS" "Express"
      "JavaScript" "MarionetteJS" "Meteor" "MomentJS" "NodeJS" "React")))))


(defun clay-setup-js-docset ()
  "Enable Dash docsets for JavaScript-related modes."
  (clay--enable-docsets
    '(rjsx-mode
       typescript-ts-mode
       (nodejs-repl-mode . nodejs-repl))))

(with-eval-after-load 'projectile
  (add-to-list 'projectile-globally-ignored-directories "node_modules"))

(clay-setup-js-docset)

(use-package! rjsx-mode
  :when clay-react?
  :mode ("\\.\\(t\\|j\\)sx\\'")
  :hook (rjsx-mode . rainbow-delimiters-mode))

(use-package! typescript-ts-mode
  :when clay-ts?
  :mode "\\.tsx?\\'"
  :hook ((typescript-ts-mode . eglot-ensure))
  :custom
  (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
  (typescript-indent-level clay-js-indentation-value))


(use-package! prettier-js
:hook (
(js-ts-mode . prettier-js-mode)
       (typescript-ts-mode . prettier-js-mode)
(rjsx-mode . prettier-js-mode))
  :custom (prettier-js-args '("--print-width" "100"
                              "--single-quote" "true"
                              "--trailing-comma" "all"))
  :config
  (setq prettier-js-show-errors nil))


(use-package! js
  :remote nil
  :mode ("\\.js\\'" . js-ts-mode)
  :hook ((js-ts-mode . eglot-ensure)
          (js-ts-mode . clay--setup-eslint-flymake))
  :config (clay-update-js-indentation))


(provide 'clay-javascript)
;;; clay-javascript.el ends here
