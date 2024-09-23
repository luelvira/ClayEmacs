;;; clay-finances.el --- Set up the configuration for hledger  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Lucas Elvira Martín

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

;; This module provides a easy way to communicate with hledger inside Emacs

;;; Code:

(use-package ledger-mode
  :mode "\\.\\(h?ledger\\|journal\\|j\\|lgr\\)$"
  :bind (:map ledger-mode-map
              ("TAB" . completion-at-point)
              ("M-$" . (lambda ()
                         (interactive
                          (insert "€")))))
  :custom
  (ledger-binary-path "hledger")
  (ledger-mode-should-check-version nil)
  (ledger-report-auto-width nil)
  (ledger-report-use-native-highlighting nil)
  (ledger-reports '(("bal" "%(binary) -f %(ledger-file) bal")
                    ("bal this quarter" "%(binary) -f %(ledger-file) --period \"this quarter\" bal")
                    ("bal last quarter" "%(binary) -f %(ledger-file) --period \"last quarter\" bal")
                    ("reg" "%(binary) -f %(ledger-file) reg")
                    ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
                    ("account" "%(binary) -f %(ledger-file) reg %(account)"))))


(provide 'clay-finances)
;;; clay-finances.el ends here
