;;; init.el --- init file                            -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Lucas Elvira Martín
;; Author: Lucas Elvira Martín <lucaselvira96@gmail.com>
;; License: GPL-3+

;; Keywords: Emacs, Lisp, configuration

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
;; This is the main init file for Clayemacs.
;; It sets up paths, garbage collection tweaks, and loads modular configs
;; from `lisp/`, `modules/`, and `lib/`.

;;; Code:

;;;; GC Optimization on startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1024 1024)
                  file-name-handler-alist file-name-handler-alist-original)
            (makunbound 'file-name-handler-alist-original)
            (message "*** Emacs loaded in %s seconds with %d garbage collections."
                     (emacs-init-time "%.2f") gcs-done)))

;;;; Load Path Setup
(defun update-to-load-path (folder)
  "Add FOLDER and its subdirectories to `load-path`."
  (let ((base folder))
    (unless (member base load-path)
      (add-to-list 'load-path base))
    (dolist (f (directory-files folder))
      (let ((name (concat base "/" f)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (update-to-load-path name))))))

(update-to-load-path (expand-file-name "modules" private-emacs-directory))
(update-to-load-path (expand-file-name "lisp" private-emacs-directory))
(update-to-load-path (expand-file-name "lib" private-emacs-directory))

(setq custom-file (expand-file-name "custom.el" private-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror 'nomessage))

(advice-add 'flymake-proc-legacy-flymake :before
            (lambda (&rest _)
              (message "⚠️ flymake-proc-legacy-flymake was called!")))

(advice-add 'flymake-mode :before
            (lambda (&rest _)
              (message "ℹ️ flymake-mode is being activated in buffer: %s" (buffer-name))))


;;;; Early modules (system, startup, packages)
(require 'clay-system)
(require 'startup)
(require 'clay-init-config)
(require 'init-package)
(require 'clay-persistence-config)
(require 'clay-keyboard)

;;;; Core initialization
(require 'clay-general-config)
(require 'clay-default-config)

;;;; Interface and UX
(require 'clay-ui)

(require 'clay-dired)
(require 'clay-autocomplete)

(require 'clay-develop)
(require 'clay-vterm)
;; (require 'clay-write)
(require 'clay-workflow)

(provide 'init)
;;; init.el ends here
