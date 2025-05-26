;;; init-package.el --- setup package -*- lexical-binding: t -*-
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

;;; Code:

(defgroup clay-package nil
  "Settings related to package management in ClayEmacs."
  :group 'clay)

(defcustom clay-preferred-package-manager 'elpaca
  "Preferred package manager to use in ClayEmacs.

Choose between `elpaca` and `straight`."
  :type '(choice (const :tag "Elpaca" elpaca)
                 (const :tag "Straight.el" straight))
  :group 'clay-package)

(if (eq system-type 'gnu/linux)
    (progn
      (cond
       ((eq clay-preferred-package-manager 'straight)
        (require 'clay-bootstrap-straight))
       ((eq clay-preferred-package-manager 'elpaca)
        (require 'clay-bootstrap-elpaca)))
      (require 'package))
  ;; Other OSs (non-GNU/Linux)
  (progn
    (require 'package)
    (setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
          package-archives
          '(("gnu" . "https://elpa.gnu.org/packages/")
            ("melpa" . "https://melpa.org/packages/")
            ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

    ;; Install use-package if not installed
    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))

    (eval-and-compile
      (setq use-package-always-ensure t
            use-package-expand-minimally t
            use-package-compute-statistics t
            use-package-enable-imenu-support t))
    (eval-when-compile
      (require 'use-package)
      (require 'bind-key))))


(defmacro use-package! (name &rest args)
  "Wrapper for `use-package' that convert :remote to :straight or :ensure.
use :ensure as an alternative to :elpaca.
NAME and ARGS work same as with `use-pacakge'"
  (let* ((translated-args '())
         (pkg-key (pcase clay-preferred-package-manager
                    ('straight :straight)
                    ('elpaca :ensure)
                    (_ nil))))
    (while args
      (let ((key (car args))
            (val (cadr args)))
        (cond
         ((eq key :remote)
          (when pkg-key
            (push pkg-key translated-args)
            (push val translated-args)))
         ((or
           (eq key :straight)
           ;(eq key :ensure)
           (eq key :elpaca))
          (message "Warning you shouldn't use %s with use-package %s" key name)
          (push pkg-key translated-args)
          (push val translated-args))
         (t
          (push key translated-args)
          (push val translated-args)))
      (setq args (cddr args))))
    (setq translated-args (nreverse translated-args))

    `(use-package ,name ,@translated-args)))

(provide 'init-package)
;;; init-package.el ends here
