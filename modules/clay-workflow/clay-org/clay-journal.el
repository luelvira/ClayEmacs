;;; clay-journal.el --- setup org journal            -*- lexical-binding: t; -*-

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

(use-package! org-journal
  :remote t
  :defer t
  :custom
  (org-journal-dir clay-org-capture-journal-file)
  (org-journal-file-format "%Y-%m-%d")
  (org-journal-enable-encryption nil)
  (org-journal-encrypt-journal nil))

(provide 'clay-journal)
;;; clay-journal.el ends here
