;;; clay-pomodoro.el --- pomodoro setup configuration  -*- lexical-binding: t; -*-

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

;;;###autoload
(defun clay-set-pomodoro-timer (minutes rest)
  (interactive "nMinutes: \nnRest time: ")
  (setq org-pomodoro-length minutes
        org-pomodoro-short-break-length rest))

;;;###autoload
(defun clay-set-short-pomodoro ()
  "This function set the default values from the pomodoro method"
  (interactive)
  (setq org-pomodoro-length 25
        org-pomodoro-long-break-frequency 4
        org-pomodoro-short-break-length 5
        org-pomodoro-long-break-length 10))

(defun clay-set-custom-timmers-pomodo ()
  "Function to customize the timmers for the pomodoro clock"
  (interactive)
  (setq org-pomodoro-length 90
        org-pomodoro-long-break-frequency 2
        org-pomodoro-short-break-length 10
        org-pomodoro-long-break-length 20))

(use-package! org-pomodoro
  :config
  (setq alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil)))
   org-pomodoro-clock-break t
   org-pomodoro-manual-break t)
  (clay-set-custom-timmers-pomodo))

(provide 'clay-pomodoro)
;;; clay-pomodoro.el ends here
