;;; clay-develop.el --- Set up the IDE               -*- lexical-binding: t; -*-

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

;; This module provides some configuration that aims to help you while you are
;; writting code

;;; Code:

(defgroup clay-dev nil
          "Group used to setup variables of clay-dev."
          :group 'clay
          :prefix "clay-dev"
          :tag "Clay Dev")

(defgroup clay-langs nil
  "Flags to enable or disable language-specific modules."
  :group 'clay-dev
  :prefix "clay-dev")

(defcustom clay-python? nil
  "Enable support for Python projects."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-web? nil
  "Enable support for web development (HTML, CSS, JS, etc.)."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-ts? nil
  "Enable support for TypeScript files."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-react? nil
  "Enable support for React projects."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-haskell? nil
  "Enable support for Haskell projects."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-java? nil
  "Enable support for Java projects."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-clojure? nil
  "Enable support for clojure projects."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-ps? nil
  "Enable support for ps projects."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-uml? nil
  "Enable support for uml language."
  :type 'boolean
  :group 'clay-langs)

(defcustom clay-elisp? nil
  "Enable support for elisp language."
  :type 'boolean
  :group 'clay-langs)

;; Load always these base modules (non-optional)
(require 'clay-dev-core)
(require 'clay-dev-lsp)
(require 'clay-dev-enhancements)
(require 'clay-dev-treesitter)
(require 'clay-version-control)

(when clay-python?
  (require 'clay-python))

(when clay-web?
  (require 'clay-web))

(when clay-elisp?
  (require 'clay-elisp))

(when clay-haskell?
  (require 'clay-haskell))

(when clay-java?
  (require 'clay-java))

(when clay-uml?
  (require 'clay-uml))


(provide 'clay-develop)
;;; clay-develop.el ends here
