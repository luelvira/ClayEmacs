;;; clay-python.el --- Python configuration          -*- lexical-binding: t; -*-

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

;; Set up the python module

;;; Code:

(defvar clay-python-ruff-executable "ruff"
 "Path for ruff executable.")

(defun clay-flymake-ruff (report-fn &rest args)
  "Flymake backend for ruff."
  (when (executable-find clay-python-ruff-executable)
    (let* ((source (current-buffer))
           (temp-file (make-temp-file "ruff-" nil ".py"))
           (default-directory (or (vc-root-dir) default-directory))
           (proc (make-process
                  :name "ruff-flymake"
                  :buffer (generate-new-buffer "*ruff-flymake*")
                  :command (list clay/python-ruff-executable "--quiet" "--format" "json" temp-file)
                  :noquery t
                  :sentinel (lambda (p _ev)
                              (when (eq 'exit (process-status p))
                                (unwind-protect
                                    (when (buffer-live-p source)
                                      (with-current-buffer (process-buffer p)
                                        (goto-char (point-min))
                                        (let ((json-array-type 'list)
                                              (json-object-type 'alist)
                                              (diags '()))
                                          (dolist (err (json-read))
                                            (let-alist err
                                              (let* ((line .location.start.line)
                                                     (col .location.start.column)
                                                     (msg .message)
                                                     (type :warning))
                                                (push (flymake-make-diagnostic source
                                                                               (flymake-diag-region source line col)
                                                                               type
                                                                               msg)
                                                      diags)))))
                                        (funcall report-fn diags)))
                                  (kill-buffer (process-buffer p))
                                  (delete-file temp-file))))))
           (with-current-buffer source
             (save-restriction
               (widen)
               (write-region nil nil temp-file nil 0)))))))

(use-package! python-mode
  :hook
  (python-mode . (lambda ()
                   (add-hook 'flaymake-diagnostic-functions #'clay-flymake-ruff nil t))))
  :init
  (setq python-indent-guess-indent-offset t
        python-indent-guess-indent-offset-verbose nil
        python-shell-interpreter "python3"))

(use-package! pyvenv
  :init (setenv "WORKON_HOME" "/home/lucas/.pyenv/versions")
  :commands (pyvenv-activate pyvenv-workon)
  :config
  (pyvenv-mode 1)
  (add-hook 'python-mode-local-vars-hook #'pyvenv-track-virtualenv)
  (add-to-list 'global-mode-string
               '(pyvenv-virtual-env-name (" venv:" pyvenv-virtual-env-name " "))
               'append))


(provide 'clay-python)
;;; clay-python.el ends here
