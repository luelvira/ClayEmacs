;;; clay-time-management.el --- clay time management  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Lucas Elvira Martín

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

(with-eval-after-load 'org 
(setq org-duration-format 'h:mm)

(defun my/time-string-to-minutes (time-string)
  "Convierte una cadena TIME-STRING a minutos. Soporta los formatos 'HH:MM' y 'Xh'."
  (cond
   ;; Formato HH:MM
   ((string-match "\\([0-9]+\\):\\([0-9]+\\)" time-string)
    (let* ((hours (string-to-number (match-string 1 time-string)))
           (minutes (string-to-number (match-string 2 time-string))))
      (+ (* hours 60) minutes)))
   ;; Formato Xh
   ((string-match "\\([0-9]+\\)h" time-string)
    (let ((hours (string-to-number (match-string 1 time-string))))
      (* hours 60)))
   ;; Formato no reconocido, devuelve 0
   (t 0)))

(defun my/org-clocktable-with-difference (ipos tables params)
  (org-clocktable-write-default ipos tables
                                (plist-put params :properties '("Effort")))
  (save-excursion
    (goto-char ipos)
    (search-forward "| Effort")
    (org-table-move-column-right)
    (org-table-move-column-right)
    (org-table-insert-column)
    (org-table-move-column-right)
    (insert "Difference")
    (forward-line 1)
      (while (org-at-table-p)
        (let* ((clock-time-str (org-table-get-field 2))
               (effort-str     (org-table-get-field 3))
               (clock-time (if clock-time-str
                               (my/time-string-to-minutes clock-time-str) 0))
               (effort     (if effort-str
                              (my/time-string-to-minutes effort-str) 0))
               (absdiff (abs (- clock-time effort)))
               (difference (if (< clock-time effort)
                               (format "-%02d:%02d" (/ absdiff 60) (mod absdiff 60))
                               (format "%02d:%02d"  (/ absdiff 60) (mod (abs absdiff) 60)))))
          (if (= effort 0)
              (forward-line 1)
            (progn 
              (org-table-goto-column 3)
              (org-table-blank-field)
              (insert (format "%02d:%02d" (/ effort 60) (mod effort 60)))
              (org-table-goto-column 4)
              (insert (format "%s" difference)))
            (forward-line 1)))
    (org-table-align)))))

(provide 'clay-time-management)
;;; clay-time-management.el ends here
