;;; clay-font-settings.el --- Nerding out on typography  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

;; Author: Lucas Elvira Martín <lucaselvira96@gmail.com>
;; Keywords: faces

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

(defcustom clay-default-font "FiraCodeNerdFont"
  "Font string for UI fonts."
  :type 'string
  :group 'clay-gui)

(defcustom clay-fixed-font "FiraCodeNerdFont"
  "Font string for fixed pitch modes."
  :type 'string
  :group 'clay-gui)

(defcustom clay-variable-font "Iosevka Aile"
  "Font string for variable pitch texts."
    :type 'string
    :group 'clay-gui)


(defcustom clay-ui-italic-comment-face t
           "Non-nil to enable italic face in comments."
           :group 'clay-gui
           :type 'boolean
           :set (lambda (k v)
                  (set-default k v)
                  (when (fboundp 'clay-update-comment-font-face)
                  (clay-update-comment-font-face))))

(defcustom clay-font-lock-italic-keyword-face nil
           "Non-nil to enable italic face in keywords."
           :type 'boolean
           :group 'clay-gui
           :set (lambda (k v)
                  (set-default k v)
                  (when (fboundp 'clay-update-keyword-font-face)
                      (clay-update-keyword-font-face))))

(defcustom clay-enable-ligatures? nil
           "Non-nil to enable ligatures in `prog-mode'."
           :type 'boolean
           :group 'clay-gui)

(defcustom clay-extra-symbols-alist
  '(
    ;; Functional programming
    :lambda       "λ"
    :def          "ƒ"
    :composition  "∘"
    :map          "↦"
    ;; Control flow
    :not          "¬"
    :in           "∈"
    :not-in       "∉"
    :and          "∧"
    :or           "∨"
    :for          "∀"
    :some         "∃"
    :return       "⟼"
    :yield        "⟻"

    ;; types
    :null         "∅"
    :true         "𝕋"
    :false        "𝔽"
    :int          "ℤ"
    :float        "ℝ"
    :str          "𝕊"
    :bool         "𝔹"
    :list         "𝕃"

    ;; Other
    :union        "⋃"
    :intersect    "∩"
    :diff         "∖")
  "Plist of semantic symbols and their corresponding ligatures.

This list maps symbolic keywords to their preferred visual ligature
representations. It is used for prettifying symbols."
  :type '(plist :key-type (symbol :tag "Symbol")
                :value-type (string :tag "Unicode Character"))
  :group 'clay-gui)


(defcustom clay-ligatures-prog-mode-list
  '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
     ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
     "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
     "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
     "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
     "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
     "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
     "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
     ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
     "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
     "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
     "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
     "\\\\" "://")
  "List with symbols used to define the ligatures when possible."
  :type '(repeat string)
  :group 'clay-gui)

(defvar clay-extra-symbols-mode-alist nil)

(defun clay-update-comment-font-face ()
  (if clay-ui-italic-comment-face
    (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
    (set-face-attribute 'font-lock-comment-face nil :slant 'normal)))


(defun clay-update-keyword-font-face ()
  (if clay-ui-italic-comment-face
    (set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
    (set-face-attribute 'font-lock-keyword-face nil :slant 'normal)))


(defun clay-enable-ligatures ()
  "Setup the configuration for `ligature-mode' and activate it."
  (ligature-set-ligatures 't '("www"))
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  (ligature-set-ligatures '(prog-mode org-mode) clay-ligatures-prog-mode-list)
  (global-ligature-mode t))

(defun clay-disable-ligatures ()
  "Disable ligatures in all modes."
  (global-ligature-mode -1))

(defun clay-activate-prettify-symbols ()
  "Add kooks for custom modes to enable `prettify-symbols-mode'."
  (add-hook 'prog-mode-hook #'clay-enable-prettify-symbols)
  (add-hook 'org-mode-hook #'clay-enable-prettify-symbols)
  (add-hook 'gfm-mode-hook #'clay-enable-prettify-symbols))

(defun clay-disable-prettify-symbols ()
  "Disable prettify-symbols in all modes."
  (prettify-symbols-mode -1)
  (remove-hook 'prog-mode-hook #'clay-enable-prettify-symbols)
  (remove-hook 'org-mode-hook  #'clay-enable-prettify-symbols)
  (remove-hook 'gfm-mode-hook  #'clay-enable-prettify-symbols))


(defun clay-enable-prettify-symbols ()
  "Enable prettify-symbols-mode with symbols from `clay-extra-symbols-mode-alist'."
  (message "entra")
  (let ((symbols (alist-get major-mode clay-extra-symbols-mode-alist)))
    (when symbols
      (setq prettify-symbols-alist symbols)
      (when (bound-and-true-p prettify-symbols-mode)
        (prettify-symbols-mode -1))
      (prettify-symbols-mode +1))))

(defun clay-map-prettify-symbols (modes &rest symbol-strings-plist)
  "Register pretty symbols for MODES based on SYMBOL-STRINGS-PLIST.

If plist is nil, clears existing mappings for the modes.
Also adds a hook to each mode to enable prettify-symbols-mode."
    (if (null (car-safe symbol-strings-plist))
    (dolist (mode (ensure-list modes))
      (setf (alist-get mode clay-extra-symbols-mode-alist nil t) nil)
      (let ((hook-name (intern (format "%s-hook" mode))))
          (remove-hook hook-name #'clay-enable-prettify-symbols)))
    (let ((results nil))
      (while symbol-strings-plist
        (let* ((symbol (pop symbol-strings-plist))
                (string (pop symbol-strings-plist))
                (unicode (plist-get clay-extra-symbols-alist symbol)))
          (when (and string unicode)
            (push (cons string unicode) results))))
      (dolist (mode (ensure-list modes))
        (setf (alist-get mode clay-extra-symbols-mode-alist)
          (if-let* ((old-results (alist-get mode clay-extra-symbols-mode-alist)))
            (dolist (cell results old-results)
              (setf (alist-get (car cell) old-results) (cdr cell)))
            results))
            (let ((hook-name (intern (format "%s-hook" mode))))
          (add-hook hook-name #'clay-enable-prettify-symbols ))))))

(setq prettify-symbols-unprettify-at-point 'right-edge)

(use-package! ligature
  :when clay-enable-ligatures?
  :config
  (clay-enable-ligatures))

(provide 'clay-font-settings)
;;; clay-font-settings.el ends here
