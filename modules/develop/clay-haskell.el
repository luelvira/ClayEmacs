;;; clay-haskell.el --- haskell configuration        -*- lexical-binding: t; -*-

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

(defun clay-get-module-name ()
  "Return the name of the current module.
The module name is extracted from the function `buffer-file-name',
and the `projectile-project-root'"
  (let* ((full-name (buffer-file-name))
        (name-from-project (replace-regexp-in-string
                            "\\(app/\\)\\|\\(src/\\)\\|\\(lib/\\)"
                            ""
                            (replace-regexp-in-string (projectile-project-root full-name) "" full-name))))
    (file-name-sans-extension
     (replace-regexp-in-string
      "/"
      "."
      name-from-project))))


(with-eval-after-load 'projectile
  (add-to-list 'projectile-project-root-files "stack.yaml")
  (add-to-list 'projectile-project-root-files "*.cabal"))

(with-eval-after-load 'autoinsert
  (define-auto-insert
    '("\.l?hs\\'" . "Haskell skeleton")
    '("Short description: "
      "{- |" \n
      "Module: " (clay-get-module-name)  \n
      "Description: " str \n
      "Copyright: " (format "(C) %s <%s>, %s"
                            (user-full-name)
                            user-mail-address
                            (format-time-string "%Y")) \n
      "License: GPL-3" \n
      "Maintainer: " user-mail-address \n \n
      _ \n
      "-}" \n
      "module " (clay-get-module-name) " where" \n
)))


(use-package haskell-mode
  :config
  (setq haskell-process-suggest-remove-import-lines t
        haskell-process-auto-import-loaded-modules t
        haskell-process-show-overlays nil
        haskell-process-type 'cabal-repl))


(provide 'clay-haskell)
;;; clay-haskell.el ends here
