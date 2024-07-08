;;; early-init.el --- early init file -*- lexical-binding: t -*-
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

;; SetupFolder
(defvar private-emacs-directory nil
  "The folder where the Emacs configuration is stored.")
(setq private-emacs-directory user-emacs-directory
      ;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
      user-emacs-directory (expand-file-name "~/.cache/emacs/")
      url-history-file (expand-file-name "url/history" user-emacs-directory))
;; -SetupFolder

;; DisablePackage
(setq package-enable-at-startup nil)
;; -DisablePackage

;; DefferGC
(setq site-run-file nil                  ; No site-wide run-time initializations.
      inhibit-default-init t             ; No site-wide default library
      gc-cons-threshold (* 50 1024 1024) ; The default is 800 kilobytes. Measured in bytes.
      gc-cons-percentage 0.2
      native-comp-eln-load-path (list (expand-file-name "eln-cache" user-emacs-directory)))
;; -DefferGC

;; FilenameHandler
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
;; -FilenameHandler

;; DefaultUI
(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
;; -DefaultUI

(provide 'early-init)
;;; early-init.el ends here
