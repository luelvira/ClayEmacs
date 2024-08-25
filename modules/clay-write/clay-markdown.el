;;; clay-markdown.el --- clay markdown               -*- lexical-binding: t; -*-

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

;; Default configuration for markdown export and markdown visualization

;;; Code:



(provide 'clay-markdown)
;;; clay-markdown.el ends here

(use-package markdown-mode
  :straight t
  :mode ("\\.mdx?\\'" . gfm-mode)
  :config
  (setq markdown-command "marked"))

(defun markdown-html (buffer)
  "Wrap the markdown preview into a HTML document to visualize it inside a browser.
BUFFER is the markdown content file."
  (princ (with-current-buffer buffer
           (concat
            "<!DOCTYPE html><html><title>Impatient Markdown</title>"
            "<xmp theme=\"united\" style=\"display:none;\">"
            (buffer-substring-no-properties (point-min) (point-max))
            "</xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script>"
            "</html>"))
         (current-buffer)))

(use-package ox-gfm)
