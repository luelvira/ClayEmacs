;; -*- lexical-binding: t -*-
;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
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

;; This file has been automatically generated. DO NOT EDIT.
;; Sources are available from https://github.com/luelvira/dotfiles/

;;; Code:

(use-package nerd-icons :defer t)
(use-package nerd-icons-dired
    :defer t
    :hook
    (dired-mode . nerd-icons-dired-mode))
(use-package nerd-icons-completion
    :defer t
    :config
    (nerd-icons-completion-mode))

(use-package ligature
  :config
 ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures '(prog-mode org-mode) lem/ligatures-prog-mode-list)
  ;; (ligature-set-ligatures 't lem/ligatures-extra-symbols)
 (global-ligature-mode t))

(defconst lem-fixed "FiraCodeNerdFont"
  "Font string for fixed pitch modes.")
(defconst lem-default "FiraCodeNerdFont"
  "Font string for UI fonts.")
(defconst lem-variable "Iosevka Aile"
  "Font string for variable pitch texts.")

;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)
(add-to-list 'default-frame-alist '(family . lem-default))

(defvar lem/ligatures-prog-mode-list
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
    "\\\\" "://"))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (lem/set-fonts frame)
                (lem/set-background frame)))
  (add-hook 'after-init-hook
            (lambda ()
              (lem/set--fonts)
              (lem/set-background))))
