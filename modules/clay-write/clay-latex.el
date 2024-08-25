;;; clay-latex.el --- clay-latex                     -*- lexical-binding: t; -*-

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

;; 

;;; Code:

(use-package auctex)
(use-package cdlatex)

(defcustom clay-org-plain-latex-template
  (concat
   "\\documentclass[11pt]{article}\n"
   "[NO-DEFAULT-PACKAGES]\n"
   "[NO-PACKAGES]\n"
   "\\renewcommand{\\baselinestretch}{1.15}\n"
   "\\parskip=6pt\n"
   "\\renewcommand{\\familydefault}{\\sfdefault}\n")
  "Define an empty class for latex."
  :group 'lem-write
  :type 'string)

(defcustom clay-org-altacv-latex-template
  (concat
   "\\documentclass[10pt,a4paper,ragged2e,withhyper]{altacv}\n"
   "% Change the page layout if you need to\n"
   "\\geometry{left=1.25cm,right=1.25cm,top=1.5cm,bottom=1.5cm,columnsep=1.2cm}\n"
   "% Use roboto and lato for fonts\n"
   "\\renewcommand{\\familydefault}{\\sfdefault}\n"
   "% Change the colours if you want to\n"
   "\\definecolor{SlateGrey}{HTML}{2E2E2E}\n"
   "\\definecolor{LightGrey}{HTML}{666666}\n"
   "\\definecolor{DarkPastelRed}{HTML}{450808}\n"
   "\\definecolor{PastelRed}{HTML}{8F0D0D}\n"
   "\\definecolor{GoldenEarth}{HTML}{E7D192}\n"
   "\\colorlet{name}{black}\n"
   "\\colorlet{tagline}{PastelRed}\n"
   "\\colorlet{heading}{DarkPastelRed}\n"
   "\\colorlet{headingrule}{GoldenEarth}\n"
   "\\colorlet{subheading}{PastelRed}\n"
   "\\colorlet{accent}{PastelRed}\n"
   "\\colorlet{emphasis}{SlateGrey}\n"
   "\\colorlet{body}{LightGrey}\n"
   "% Change some fonts, if necessary\n"
   "\\renewcommand{\\namefont}{\\Huge\\rmfamily\\bfseries}\n"
   "\\renewcommand{\\personalinfofont}{\\footnotesize}\n"
   "\\renewcommand{\\cvsectionfont}{\\LARGE\\rmfamily\\bfseries}\n"
   "\\renewcommand{\\cvsubsectionfont}{\\large\\bfseries}\n"
   "% Change the bullets for itemize and rating marker\n"
   "% for \cvskill if you want to\n"
   "\\renewcommand{\\itemmarker}{{\\small\\textbullet}}\n"
   "\\renewcommand{\\ratingmarker}{\\faCircle}\n")
  "Template for the CV generator."
  :type 'string
  :group 'lem-write)

(defcustom clay-org-moderncv
  (concat
   "\\documentclass{moderncv}\n"
   "\\usepackage[spanish]{babel}\n"
   "\\moderncvstyle{classic}\n"
   "\\moderncvcolor{green}\n"
   "\\renewcommand{\\familydefault}{\\sfdefault}\n"
   "\\usepackage[utf8]{inputenc}\n"
   "% Social icons\n"
   "\\social[linkedin]{lucas-elvira-martin}\n"
   "\\social[github]{luelvira}\n")
  "Template for modern cv."
  :type 'string
  :group 'lem-write)

(with-eval-after-load 'ox-latex
  (setq org-cite-biblatex-options 
        "backend=biber, style=ieee, isbn=false,sortcites, maxbibnames=5, minbibnames=1"
        ;; delete unwanted file extensions after latexMK
        org-latex-logfiles-extensions
        (quote (
                "lof" "lot" "tex~" "aux"  "idx"
                "log" "out" "toc" "nav"   "snm"
                "vrb" "dvi" "fdb_latexmk" "blg"
                "brf" "fls" "entoc" "ps"  "spl"
                "bbl" "xmpi" "run.xml"    "bcf"
                "acn" "acr" "alg" "glg"   "gls"
                "ist")))
  (add-to-list 'org-latex-classes '("org-plain-latex"
                                    clay-org-plain-latex-template
                                    ("\\section{%s}" . "\\section*{%s}")
                                    ("\\subsection{%s}" . "\\subsection*{%s}")
                                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes '("altacv"
                                    clay-org-altacv-latex-template
                                    ("\\cvsection{%s}" . "\\cvsection*{%s}")))
  (add-to-list 'org-latex-classes '("moderncv" clay-org-moderncv))

  (defun my-latex-filter-removeOrgAutoLabels (text backend info)
    "Org-mode automatically generates labels for headings despite explicit use of `#+LABEL`. This filter forcibly removes all automatically generated org-labels in headings."
    (when (org-export-derived-backend-p backend 'latex)
      (replace-regexp-in-string "\\\\label{sec:org[a-f0-9]+}\n" "" text)))

  (add-to-list 'org-export-filter-headline-functions
               'my-latex-filter-removeOrgAutoLabels))

(provide 'clay-latex)
;;; clay-latex.el ends here
