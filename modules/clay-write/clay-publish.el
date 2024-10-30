;;; clay-publish.el --- Configure the org publish project  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Lucas Elvira Martín

;; Author: Lucas Elvira Martín <lucaselvira96@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((ox-publish))

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

;; This module configure custom backends and functions for the org publish project

;;; Code:

(require 'ox-publish nil t)
(require 'ox nil t)

(defcustom clay--hugo-plist nil
  "List of properties to be added before export org files."
  :type 'plist
  :group 'clayemacs
  :version "0.1.0")

(defcustom clay--hugo-dirs (list
                            'org org-roam-directory
                            'hugo lem/website_folder)
  "A key-list with the name of the project and the base dir of them."
  :type '(plist :key-type (symbol :tag "Name")  :value-type (directory :tag "Base directory"))
  :group 'clayemacs
  :version "0.1.0")

(defcustom clay--hugo-ignore-keywords '("filetags" "cite_export" "bundle" "language")
  "A list of keywords to be filtered.

Keep the `bundle' keyword to prevent repeat this option."
  :type '(list :value-type 'String)
  :group 'clayemacs
  :version "0.1.0")

(defun clay--org-publish-get-file-tags (filename)
  "Return the list of  filetags from the org file.
FILENAME is the name of the file where the tags are searched."
  (with-temp-buffer
    (insert-file-contents filename)
    (org-mode)
    (let ((filetags (org-collect-keywords '("FILETAGS"))))
      (when filetags
        (split-string (cadr (assoc "FILETAGS" filetags)) ":")))))

(defun filter-org-files-by-filetags (directory select-tags)
  "Return a list of files from DIRECTORY.
Those files have some of the SELECT-TAGS in the property FILETAGS."
  (let (filtered-files) (dolist (file (directory-files-recursively directory "\\.org$"))
      (let ((tags (clay--org-publish-get-file-tags file)))
        (when (and tags (seq-intersection select-tags tags))
          (push file filtered-files))))
    filtered-files))


(defun clay-org-publish-to-org (plist filename pub-dir)
  "Replace `org-org-publish-to-org' function to set the custom backend.
PLIST is a property list
FILENAME the path of the path to be processed
PUB-DIR the directory where the project will be published."
  (org-publish-org-to 'filter-org
                      filename
                      ".org"
                      plist
                      pub-dir))

(org-export-define-derived-backend 'filter-org 'org
  :options-alist '(
                   (:bundle "BUNDLE" nil nil)
                   (:language "LANGUAGE" nil "def")
                   (:category "CATEGORY" nil "")
                   (:with-bundle nil t "b" t)
                   (:hugo-base-dir "BASE_DIR" "../../../" t)
                   (:with-last-mod nil "lm" t)
                   (:with-language nil t "lg" t)
                   )
  :filters-alist '((:filter-keyword  . my-keyword-function))
  :translate-alist
  '((template . clay--org-template)
    (link . clay--org-link)
    (paragraph . clay-org-identity)))

(org-export-define-derived-backend 'my-hugo 'hugo
  :translate-alist '(()))

(defun my-keyword-function (keywordtext _back _info)
  "Filter the keywords based on `clay--hugo-ignore-keywords.
If the KEYWORDTEXT matches with any of the elements from the list,
returns an empty string"
  (let ((valid t))
    (dolist (elem clay--hugo-ignore-keywords valid)
      (when (string-match-p elem keywordtext)
        (setq valid nil)))
    (if valid
        keywordtext
      "no la quiero\n")))

(defun clay--org-link (link desc info)
  "Transcode LINK object into Org format.

This function will prevent links of ID type
DESC is the description part of the link, or the empty string.
INFO is a plist holding contextual information. See `org-export-data'."
  (message (format "desc %s type %s" desc (org-element-property :type link)))
  (let ((type (org-element-property :type link)))
    (cond ((string= type "id") desc)
;;        ((string= type "file")
;;           (format
;;            "#+ATTR_HTML: %s%s"
;;            (clay--get-inline-attributes link)
;;            (org-org-link link desc info)))
          (t (org-org-link link desc info)))))

(defun clay--get-inline-attributes (link)
  "Read the attributes from a LINK of type file."
  (let* ((parent (org-element-parent-element link))
         (attributes (org-combine-plists (org-export-read-attribute :attr_html parent)
                                        (org-export-read-attribute :attr_html link)))
         (value ""))
    (dolist (key (plist-get-keys attributes) value)
      (setq value (format "%s %s: %s" value key (plist-get attributes key))))))

                          

(defun clay-org-identity (blob contents _info)
  "Transcode BLOB element or object back into Org syntax.
CONTENTS is its contents, as a string or nil.  INFO is ignored.

With the original function `org-org-identity' the attributes are removed,
so I need to override it and skip this step in case of the element is a inline image"
  (let ((case-fold-search t))
    (if (string-match "file" contents)
        (org-export-expand blob contents t)
      (org-org-identity blob contents _info))))

(defun clay--org-template (contents info)
  "Return Org document template with document keywords.
CONTENTS is the transcoded contents string.  INFO is a plist used
as a communication channel.
This function was take from ox-org."
  (concat
   (and (plist-get info :time-stamp-file)
	(format-time-string "# Created %Y-%m-%d %a %H:%M\n"))
   (org-element-normalize-string
    (mapconcat #'identity
	       (org-element-map (plist-get info :parse-tree) 'keyword
		 (lambda (k)
		   (and (string-equal (org-element-property :key k) "OPTIONS")
			(concat "#+options: "
				(org-element-property :value k)))))
	       "\n"))
   (and (plist-get info :with-title)
	(format "#+title: %s\n" (org-export-data (plist-get info :title) info)))
   (and (plist-get info :with-date)
	(let ((date (org-export-data (org-export-get-date info) info)))
	  (and (org-string-nw-p date)
	       (format "#+date: %s\n" date))))
   (and (plist-get info :with-author)
	(let ((author (org-export-data (plist-get info :author) info)))
	  (and (org-string-nw-p author)
	       (format "#+author: %s\n" author))))
   (and (plist-get info :with-email)
	(let ((email (org-export-data (plist-get info :email) info)))
	  (and (org-string-nw-p email)
	       (format "#+email: %s\n" email))))
   (and (plist-get info :with-creator)
	(org-string-nw-p (plist-get info :creator))
	(format "#+creator: %s\n" (plist-get info :creator)))
   ;; Add custom front matter
   (let* ((filename (clay--slugify (car (plist-get info :title))))
          (bundle (downcase (or (plist-get info :bundle)
                      (plist-get info :category)))))
     (and (plist-get info :with-bundle)
        (format "#+HUGO_BUNDLE: %s/%s\n" bundle filename)))
   "#+EXPORT_FILE_NAME: index\n"
   (and (plist-get info :with-language)
        (format "#+LANGUAGE: %s\n" (or (plist-get info :language) "alt")))
   (format "#+HUGO_BASE_DIR: %s\n" (or (plist-get info :hugo-base-dir)
                                       (plist-get clay--hugo-dirs 'hugo)))
   contents))

(defun clay--slugify (title)
  "Convert string TITLE into a valid `slug' and return it."
  (let* (
         (str (downcase title))
         (str (replace-regexp-in-string "[^[:alnum:][:space:]()]" "" str))
         (str (replace-regexp-in-string "\\(^[[:space:]]*\\|[[:space:]]*$\\)" "" str))
         (str (replace-regexp-in-string "[[:space:]]\\{2,\\}" " " str))
         ;; Replace parentheses with double-hyphens.
         (str (replace-regexp-in-string "\\s-*([[:space:]]*\\([^)]+?\\)[[:space:]]*)\\s-*" " -\\1- " str))
         ;; Replace spaces with hyphens.
         (str (replace-regexp-in-string " " "_" str))
         ;; Remove leading and trailing hyphens.
         (str (replace-regexp-in-string "\\(^[_]*\\|[_]*$\\)" "" str)))
    str))

(defun clay--org-publish-project-filtered ()
  "Define the project properties to be published with a filter rule."
  (let* ((select-tags '("EXPORT")) ;; should be the same as the property :select-tags
         (filtered-files (filter-org-files-by-filetags org-roam-directory select-tags)))
    (setq org-publish-project-alist
          `(("org"
             :base-directory ,org-roam-directory
             :publishing-directory ,(concat (plist-get clay--hugo-dirs 'hugo) "/org_content/posts/")
             :recursive nil
             ;; exclude all files because only want the files that are in the filtered-files list
             :exclude "^.\*.org$"
             :include ,filtered-files
             :select-tags ("EXPORT")
             :publishing-function clay-org-publish-to-org
             :time-stamp-file nil
             :with-creator nil
             :with-tags nil
             :auto-sitemap nil
             ; by default, I export the content into
             ; projectdir/org_content/posts/. Because that, I go up 2 dirs
             :hugo-base-dir "../../")
            ("hugo"
             :base-directory ,(concat (plist-get clay--hugo-dirs 'hugo) "org_content/")
             :publishing-directory ,(concat (plist-get clay--hugo-dirs 'hugo) "content/")
             :recursive t
             :plublish-function clay--org-publish-to-hugo)))))

(clay--org-publish-project-filtered)


(provide 'clay-publish)
;;; clay-publish.el ends here
