;;; clay-dev-tests.el --- Development environment checks -*- lexical-binding: t; -*-
;;; Commentary:
;; Basic checks to validate core development environment setup.
;; Currently focuses on treesit grammars and eglot integration.

;;; Code:

(defun clay/treesit-language-installed-p (lang)
  "Check if LANG grammar is available and ready."
  (and (treesit-language-available-p lang)
       (treesit-ready-p lang)))

(defun clay/treesit-report-status ()
  "Report installation status of all Tree-sitter languages."
  (interactive)
  (if (not (and (fboundp 'treesit-available-p) (treesit-available-p)))
      (message "[Tree-sitter] Not available on this Emacs build.")
    (let ((not-installed '())
          (installed '()))
      (dolist (lang treesit-language-source-alist)
        (if (clay/treesit-language-installed-p (car lang))
            (push (car lang) installed)
          (push (car lang) not-installed)))
      (message "[Tree-sitter] Installed: %s" (string-join (mapcar #'symbol-name (sort installed #'string<)) ", "))
      (if not-installed
          (message "[Tree-sitter] Missing: %s" (string-join (mapcar #'symbol-name (sort not-installed #'string<)) ", "))
        (message "[Tree-sitter] All grammars installed.")))))

(defun clay/test-eglot-hook-coverage ()
  "Check that all major programming modes have eglot enabled."
  (interactive)
  (let ((missing '())
        (hooks '(python-mode python-ts-mode
                 typescript-mode typescript-ts-mode
                 js2-mode tsx-ts-mode-mode
                 web-mode haskell-mode)))
    (dolist (hook hooks)
      (unless (member (cons hook #'eglot-ensure) (default-value 'eglot-server-programs))
        (push hook missing)))
    (if missing
        (message "[Eglot] Missing eglot-ensure for: %s" (string-join (mapcar #'symbol-name missing) ", "))
      (message "[Eglot] All hooks correctly configured."))))

(defun clay/dev-run-tests ()
  "Run all development setup validations."
  (interactive)
  (clay/treesit-report-status)
  (clay/test-eglot-hook-coverage))

(provide 'clay-dev-tests)
;;; clay-dev-tests.el ends here

