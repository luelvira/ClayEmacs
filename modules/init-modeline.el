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

(eval-when-compile
  (require 'init-consts))

;; vars used for the modeline
(setq display-time-format "%H:%M %b %y"
      display-time-default-load-average nil)
(display-time-mode 1)

(use-package doom-modeline
  :disabled
  :hook (after-init . doom-modeline-mode)
  :init
  (setq projectile-dynamic-mode-line nil)
  ;; Set these early so they don't trigger variable watchers
  (setq doom-modeline-bar-width 3
        doom-modeline-github nil
        doom-modeline-mu4e nil
        doom-modeline-minor-modes t
        doom-modeline-persp-name nil
        doom-modeline-major-mode-icon t
        doom-modeline-buffer-file-name-style 'relative-from-project
        ;; Only show file encoding if it's non-UTF-8 and different line endings
        ;; than the current OSes preference
        doom-modeline-icons (display-graphic-p)
        doom-modeline-buffer-encoding 'nondefault
        doom-modeline-default-eol-type 0))

(use-package mood-line
  :config
  (setq mood-line-glyph-alist mood-line-glyphs-fira-code)
  (mood-line-mode))

(use-package diminish)

(use-package minions
  :hook ((doom-modeline-mode mood-line-mode) . minions-mode))
