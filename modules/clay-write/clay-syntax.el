;;; clay-syntax.el --- syntax check                  -*- lexical-binding: t; -*-

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

;; Configure the grammar and spell check

;;; Code:

(defcustom lem-write-dictionaries-list '("en_US" "es_ES")
  "List of dictionaries used for spell checking."
  :type 'list
  :group 'lem-write)

(defcustom lem-write-langtool-p t
  "Whether langtool should be used or not."
  :type 'bool
  :group 'lem-write)

(defcustom
  lem-write-langtool-path
  "~/.local/lib/languageTool/LanguageTool-6.3/languagetool-commandline.jar"
  "Path where the langtool jar is stored."
  :type 'string
  :group 'lem-write
  :set (lambda (k v)
         (set-default k v)
         (when
             (fboundp 'langtool-language-tool-jar)
           (setq langtool-language-tool-jar v))))

(defcustom clay-flyspell-name
  (when
      (file-exists-p "/usr/bin/hunspell")
    "hunspell")
  "Determinate the software that will be used to check the spelling."
  :type 'string
  :group 'lem-write
  :set (lambda (k v)
         (set-default k v)
         (setq ispell-program-name v)))

(defvar lem-write-dictionaries-pos 0
"Current index for the dictionaries id.")

(defmacro inc (var)
  "Macro to increment VAR using modular arithmetic."
  `(setq ,var (mod (+ 1 ,var) (length lem-write-dictionaries-list))))

(defun lem-write-switch-dictionary ()
  "Function to iterate over `lem-write-dictionaries-list'."
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (nth (inc lem-write-dictionaries-pos) lem-write-dictionaries-list)))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)))

(use-package flyspell
  :config
  (setq ispell-program-name clay-flyspell-name)
  (setq ispell-current-dictionary (nth lem-write-dictionaries-pos lem-write-dictionaries-list))
  :hook (text-mode . flyspell-mode)
  :bind (("M-<f7>" . flyspell-buffer)
         ("<f7>"   . flyspell-word)
         ("C-;"    . flyspell-auto-correct-previous-word))
  ("C-c n d" . lem-write-switch-dictionary))

(when lem-write-langtool-p
  (use-package langtool
  :config
  (setq langtool-language-tool-jar lem-write-langtool-path
        langtool-default-language (nth lem-write-dictionaries-pos lem-write-dictionaries-list))))


(provide 'clay-syntax)
;;; clay-syntax.el ends here
