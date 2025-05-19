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

;;;###autoload
(defun clay-dev-elisp-non-package-mode ()
  (setq-local byte-compile-warnings '(not free-vars noruntime unresolved)))

;;;###autoload
(defun clay-dev-elisp-flymake-load-path (orig-fn &rest args)
  (let ((elisp-flymake-byte-compile-load-path
         (append elisp-flymake-byte-compile-load-path load-path)))
    (apply orig-fn args)))

;;;###autoload
(defun clay-dev-elisp-disable-native-elisp-flymake ()
  (setq-local flymake-diagnostic-functions nil))

;;;###autoload
(defun clay-dev--setup-elisp-flymake ()
  (add-hook 'flymake-diagnostic-functions #'clay-dev--custom-elisp-flymake nil t))

(defvar clay-elisp-use-reduced-flymake t
  "If non-nil, use a reduced Flymake backend for Emacs Lisp buffers.")

(defun clay-elisp-reduced-flymake-byte-compile (report-fn &rest _args)
  "Reduced Flymake backend for Emacs Lisp that only performs byte compilation."
  (when (and buffer-file-name (file-exists-p buffer-file-name))
    (let ((source (current-buffer))
          (diagnostics nil))
      (with-temp-buffer
        (condition-case err
            (progn
              (insert-file-contents buffer-file-name)
              (emacs-lisp-mode)
              (byte-compile-from-buffer (current-buffer)))
          (error
           (let ((msg (error-message-string err)))
             (push (flymake-make-diagnostic source (point-min) (point-max)
                                            :error msg)
                   diagnostics)))))
      (funcall report-fn diagnostics))))

(define-minor-mode clay-elisp--flymake-lite-mode
  "Minor mode to enable a reduced Flymake backend for Emacs Lisp buffers."
  :lighter " FlymakeLite"
  (if clay-elisp--flymake-lite-mode
      (progn
        (remove-hook 'flymake-diagnostic-functions #'elisp-flymake-checkdoc t)
        (remove-hook 'flymake-diagnostic-functions #'elisp-flymake-byte-compile t)
        (add-hook 'flymake-diagnostic-functions #'clay-elisp-reduced-flymake-byte-compile nil t))
    (remove-hook 'flymake-diagnostic-functions #'clay-elisp-reduced-flymake-byte-compile t)
    (add-hook 'flymake-diagnostic-functions #'elisp-flymake-checkdoc nil t)
    (add-hook 'flymake-diagnostic-functions #'elisp-flymake-byte-compile nil t)))


;;;###autoload
(defun clay-dev--setup-elisp-flymake ()
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (when
                  (and clay-dev-flymake?
                       clay-dev-check-syntax?
                       clay-elisp-use-reduced-flymake)
                (clay-elisp--flymake-lite-mode 1)))))

;;;###autoload
(defun clay-dev-elisp--init-mode ()
  (message "Enable flymake-mode")
  (clay-dev-elisp-disable-native-elisp-flymake)
  (clay-dev--setup-elisp-flymake)
  (flymake-mode 1))

(use-package! elisp-mode
              :hook ((emacs-lisp-mode . clay-dev-elisp--init-mode)
                     (emacs-lisp-mode . clay-dev-elisp-non-package-mode))
              :remote nil
              :config
              (setq flymake-diagnostic-functions nil)
              (setq evil-shift-width 2)
              (advice-add 'elisp-flymake-byte-compile :around #'clay-dev-elisp-flymake-load-path))

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
