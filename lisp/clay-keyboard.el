;;; clay-keyboard.el --- Set up shortcuts            -*- lexical-binding: t; -*-

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

;; 

;;; Code:

(defgroup clay-keyboard nil
  "Group for setup keyboard configuration."
  :group 'clay
  :tag "Clay Keyboard"
  :prefix 'clay-keyboard)

(defcustom clay-use-evil? t
  "Defiene whether to load evil mode or not."
  :type 'boolean
  :group 'clay-keyboard)

(defcustom clay-leader-key "SPC"
  "The leader prefix for key in Evil mode."
  :type 'string
  :group 'clay-keyboard)

(defcustom clay-leader-global-key "C-SPC"
  "An alternative leader prefix.
This frefix should be used when Insert and Emacs states are active."
  :type  'string
  :group 'clay-keyboard)
  

(require 'clay-which-key)

(use-package! hydra
              :defer t
              :demand nil)

(when clay-use-evil?
  (require 'clay-evil))

(require 'clay-general)


(provide 'clay-keyboard)
;;; clay-keyboard.el ends here
