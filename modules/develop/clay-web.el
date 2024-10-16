;;; clay-web.el --- Web development setup            -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Lucas Elvira Martín

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


;; Custom indentation following the conventions
(defcustom lem/web-indentation-value 2
  "Default value of indentation for web mode.
Default value is 2 following the standards."
  :set (lambda (k v)
         (set-default k v)
         (when (fboundp 'lem/web-indentation)
           (lem/web-indentation)))
  :group 'lem
  :type 'number)

(defcustom lem/js-indentation-value 2
  "The default value for indent javascript and typescript files."
  :set (lambda (k v)
         (set-default k v)
         (when (fboundp 'lem/js-indentation)
           (lem/js-indentation)))
  :group 'lem
  :type 'number)


(defun lem/js-indentation ()
  "Setup the default indent for javascript files."
  (setq js-chain-indent t
        ;; These have become standard in the JS community
        js-indent-level lem/js-indentation-value
        js2-basic-offset js-indent-level
        typescript-indent-level js-indent-level
        evil-shift-width js-indent-level
        tab-width js-indent-level))

(defun lem/web-indentation ()
  "Setup the indentation for the web mode."
  (setq web-mode-markup-indent-offset lem/web-indentation-value ;; for html
        web-mode-css-indent-offset    lem/web-indentation-value ;; for css
        web-mode-code-indent-offset   lem/js-indentation-value  ;; for script/code
        web-mode-enable-auto-pairing  t
        web-mode-style-padding        lem/web-indentation-value
        web-mode-script-padding       lem/js-indentation-value))

;; Load the packages
(use-package js2-mode
  :mode "\\.jsx?\\'"
  :ensure flycheck
  :hook ((js2-mode . js2-imenu-extras-mode)
         (js2-mode . prettier-js-mode)
         (js2-mode . lem/js-indentation))
  :config
  (setq
   ;; let flycheck handle this
   js2-mode-show-parse-errors nil
   js2-mode-show-strict-warnings nil
   ;; Flycheck provides these features, so disable them: conflicting with
   ;; the eslint settings.
   js2-strict-missing-semi-warning nil)
   ;; Use js2-mode for Node scripts
   (add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode)))

(use-package prettier-js
  :custom (prettier-js-args '("--print-width" "100"
                              "--single-quote" "true"
                              "--trailing-comma" "all"))
  :config
  (setq prettier-js-show-errors nil))

(use-package js2-refactor
  :hook ((js2-mode rjsx-mode) . js2-refactor-mode))

(use-package web-mode
  :mode "(\\.htmlx?"
  :config
  (lem/web-indentation))

(use-package typescript-mode
  :disabled clay-ts?
  :ensure flycheck
  :hook ((typescript-mode . prettier-js-mode))
  :mode ("\\.\\(ts\\|tsx\\)\\'")
  :custom
  ;; TSLint is depreciated in favor of ESLint.
  (flycheck-disable-checker 'typescript-tslint)
  (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
  (typescript-indent-level lem/js-indentation-value)
  :config
  (flycheck-add-mode 'javascript-eslint 'typescript-mode))

(use-package rjsx-mode
  :disabled clay-react?)


(use-package simple-httpd :defer t)
(use-package impatient-mode :defer t)
(use-package skewer-mode :defer t)

(use-package rainbow-mode
  :hook ((css-mode sass-mode) . rainbow-mode))
(use-package sass-mode)

(use-package emmet-mode
  :straight (emmet-mode :type git :host githun :repo "smihica/emmet-mode")
  :hook (html-mode . emmet-mode))


(use-package jshint-mode
  :straight (jshint-mode :type git :host github :repo "daleharvey/jshint-mode")
  :disabled t
  :config
  ;; jshint from https://github.com/daleharvey/jshint-mode
  (add-to-list 'load-path "~/path/to/jshint-mode")
    (require 'flymake-jshint)
  (add-hook 'javascript-mode-hook
            (lambda () (flymake-mode t))))



(provide 'clay-web)
;;; clay-web.el ends here
