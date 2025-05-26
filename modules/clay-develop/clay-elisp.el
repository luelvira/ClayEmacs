;;; clay-elisp.el --- setup elisp editting configuration  -*- lexical-binding: t; -*-

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

(use-package! package-lint)
(use-package! package-lint-flymake
              :hook (emacs-lisp-mode . package-lint-flymake-setup))

(use-package! elisp-mode
              :hook ((emacs-lisp-mode . clay-dev-elisp--init-mode)
                     (emacs-lisp-mode . clay-dev-elisp-non-package-mode))
              :remote (:type built-in)
              :config
              (setq flymake-diagnostic-functions nil)
              (setq evil-shift-width 2))

(use-package rainbow-delimiters
  :init (setq rainbow-delimiters-max-face-count 4)
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

(use-package! paren
  :remote nil
  :config
  (setq show-paren-delay 0.1
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t)
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))



(provide 'clay-elisp)
;;; clay-elisp.el ends here
