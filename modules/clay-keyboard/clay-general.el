;;; clay-general.el --- Configure general            -*- lexical-binding: t; -*-

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

;; This file contains all the custom shortcuts defined whith general

;;; Code:

(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer lem/leader-key-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(lem/leader-key-def
  "b" '(:ignore t                                      :which-key "buffers/bookmarks")
  "bl" '(bookmark-jump                                 :which-key "List bookmarks")
  "bm" '(bookmark-set                                  :which-key "Set bookmark")
  "bd" '(bookmark-delete                               :which-key "Delete bookmark")
  "bw" '(bookmark-save                                 :which-key "Save current bookmark to bookmark file")
  "br" '(revert-buffer                                 :which-key "Revert buffer")
  "bi" '(switch-to-buffer                              :which-key "Switch buffer")
  "bk" '(kill-current-buffer                           :which-key "Kill current buffer")
  "bn" '(next-buffer                                   :which-key "Goto next buffer")
  "bp" '(previous-buffer                               :which-key "Goto previous-buffer buffer")
  "bs" '(save-buffer                                   :which-key "Save current buffer")
  "fD" '(lem/delete-this-file                          :which-key "Delete current file")
  "fR" '(lem/rename-this-file                          :which-key "Rename current file")
  "ER" '(lem/reload-init-file                          :which-key "Reload init file")
  "e" '(:ignore t                                      :which-key "Eshell/Evaluate")
  "eb" '(eval-buffer                                   :which-key "Evaluate elisp in buffer")
  "ed" '(eval-defun                                    :which-key "Evaluate defun containing or after point")
  "ee" '(eval-expression                               :which-key "Evaluate and elisp expression")
  "el" '(eval-last-sexp                                :which-key "Evaluate elisp expression before point")
  "er" '(eval-region                                   :which-key "Evaluate elisp in region")
  "fp" '(lem/go-dotfiles                               :which-key "Config")
  "fe" '(:ignore t                                     :which-key "Emacs files")
  "fec" '(lem/go-emacs-config                          :which-key "Emacs Config file")
  "fei" '(lem/go-emacs-init                            :which-key "Emacs init file")
  "fem" '(lem/go-emacs-modules                         :which-key "Custom libraries")
  "d"  '(:ignore t                                     :which-key "Dired")
  "dd" '(dired                                         :which-key "Open dired")
  "dj" '(dired-jump                                    :which-key "Dired jump to current")
  "dp" '(lem/jump-dotfiles                             :which-key "Go to dotfiles folder")
  "f" '(:ignore t                                      :which-key "Files")
  "fD" '(lem/delete-this-file                          :which-key "Delete current file")
  "fd" '(find-grep-dired                               :which-key "Search for string in files in DIR")
  "ff" '(find-file                                     :which-key "Find files")
  "fr" '(recentf-open-files                            :which-key "Recent files")
  "fR" '(lem/rename-this-file                          :which-key "Rename current file")
  "o"   '(:ignore t                                    :which-key "org mode")
  "ol"  '(:ignore t                                    :which-key "Link")
  "oli" '(org-insert-link                              :which-key "insert link")
  "ols" '(org-store-link                               :which-key "store link")
  "oN"  '(org-toggle-narrow-to-subtree                 :which-key "toggle narrow")
  "os"  '(lem/org-search                               :which-key "search notes")
  "oa"  '(org-agenda                                   :which-key "Status")
  "oc"  '(org-capture t                                :which-key "Capture")
  "oC"  '(:ignore t                                    :which-key "Org clock")
  "oCe" '(org-set-effort                               :which-key "Org set effort")
  "oCg" '(org-clock-goto                               :which-key "Go ot the last clock active")
  "oCi" '(org-clock-in                                 :which-key "Clock in in the current task")
  "oCI" '(org-clock-in-last                            :which-key "Clock-in the last task")
  "oCo" '(org-clock-out                                :which-key "Clock-out current clock")
  "on"  '((lambda () (interactive)
            (lem/interactive-find-file org-directory)) :which-key "Notes")
  "op"  '(:ignore t                                    :which-key "Pomodoro")
  "ops" '(org-pomodoro                                 :which-key "Start org pomodoro")
  "opt" '(set-pomodoro-timer                           :which-key "Set pomodoro timer")
  "ot"  '(:ignore t                                    :which-key "Insert time stamp")
  "ots" '(org-time-stamp                               :which-key "Insert active time stamp")
  "oti" '(org-time-stamp-inactive                      :which-key "Insert inactive stamp")
  "or"  '(:ignore t                                    :which-key "Org roam")
  "orI" '(org-roam-node-insert-immediate               :which-key "Roam insert immediately")
  "orc" '(lem/org-roam-capture-task                    :which-key "Roam capture tast")
  "orf" '(org-roam-node-find                           :which-key "Org roam node find")
  "org" '(org-roam-ui-open                             :which-key "Open org roam graph")
  "ori" '(org-roam-node-insert                         :which-key "Org roam node insert")
  "orl" '(org-roam-buffer-togle                        :which-key "Org roam buffer togle")
  "ort" '(:ignore t                                    :which-key "Org roam tag")
  "orta" '(org-roam-tag-add                            :which-key "Org roam tag add")
  "ortr" '(org-roam-tag-remove                         :which-key "Org roam tag remove")
  "ords" '(org-roam-db-sync                            :which-key "Sync org roam db")
  "p"  '(:ignore t                                     :which-key "Projectile")
  "pf" '(projectile-find-file                          :which-key "Projectile find file")
  "ps" '(projectile-switch-project                     :which-key "Projectile switch project")
  "pF" '(consult-ripgrep                               :which-key "Rip grep")
  "pc" '(projectile-compile-project                    :which-key "Compile Project")
  "pd" '(projectile-dired                              :which-key "Projectile dired")
  "s" '(:ignore t                                      :which-key "sync")
  "so" '(lem/sync-org                                  :which-key "Sync org files")
  "sc" '(lem/sync-conf                                 :which-key "Sync config folder")
  "sb" '(org-roam-db-sync                              :which-key "Reload org roam DB")
  "t"  '(:ignore t                                     :which-key "toggles")
  "tw" '(whitespace-mode                               :which-key "whitespace")
  "td" '(lem-write-switch-dictionary                   :which-key "Toggle between dictionaries")
  "tt" '(lem/toggle-transparency                       :which-key "Toggle between transparency states")
  "tl" '(org-toggle-link-display                       :which-key "Toggle org link display")
  "tL" '(display-line-numbers-mode                     :which-key "Toggle display line numbers")
  "tf" '(auto-fill-mode                                :which-key "Toggle autofill mode")
  "r" '(:ignore t                                      :which-key "sudo edit")
  "rf" '(sudo-edit-find-file                           :which-key "Sudo find file")
  "rF" '(sudo=edit                                     :which-key "sudo edit current file")
  "u" '(universal-argument                             :which-key "Universal argument")
  "v" '(:ignore t                                      :which-key "Vterminal")
  "vt" '(multi-vterm                                   :which-key "Open vterm in same window")
  "vT" '(vterm-other-window                            :which-key "Open vterm in other window")
  "d"  '(:ignore t                                     :which-key "Dired")
  "dd" '(dired                                         :which-key "Open dired")
  "dj" '(dired-jump                                    :which-key "Dired jump to current")
  "dp" '(lem/jump-dotfiles                             :which-key "Go to dotfiles folder")
  "f" '(:ignore t                                      :which-key "Files")
  "fD" '(lem/delete-this-file                          :which-key "Delete current file")
  "fd" '(find-grep-dired                               :which-key "Search for string in files in DIR")
  "ff" '(find-file                                     :which-key "Find files")
  "fr" '(recentf-open-files                            :which-key "Recent files")
  "fR" '(lem/rename-this-file                          :which-key "Rename current file")
  "o"   '(:ignore t                                    :which-key "org mode")
  "ol"  '(:ignore t                                    :which-key "Link")
  "oli" '(org-insert-link                              :which-key "insert link")
  "ols" '(org-store-link                               :which-key "store link")
  "oN"  '(org-toggle-narrow-to-subtree                 :which-key "toggle narrow")
  "os"  '(lem/org-search                               :which-key "search notes")
  "oa"  '(org-agenda                                   :which-key "Status")
  "oc"  '(org-capture t                                :which-key "Capture")
  "oC"  '(:ignore t                                    :which-key "Org clock")
  "oCe" '(org-set-effort                               :which-key "Org set effort")
  "oCg" '(org-clock-goto                               :which-key "Go ot the last clock active")
  "oCi" '(org-clock-in                                 :which-key "Clock in in the current task")
  "oCI" '(org-clock-in-last                            :which-key "Clock-in the last task")
  "oCo" '(org-clock-out                                :which-key "Clock-out current clock")
  "on"  '((lambda () (interactive)
            (lem/interactive-find-file org-directory)) :which-key "Notes")
  "op"  '(:ignore t                                    :which-key "Pomodoro")
  "ops" '(org-pomodoro                                 :which-key "Start org pomodoro")
  "opt" '(set-pomodoro-timer                           :which-key "Set pomodoro timer")
  "ot"  '(:ignore t                                    :which-key "Insert time stamp")
  "ots" '(org-time-stamp                               :which-key "Insert active time stamp")
  "oti" '(org-time-stamp-inactive                      :which-key "Insert inactive stamp")

  "or"  '(:ignore t                                    :which-key "Org roam")
  "orI" '(org-roam-node-insert-immediate               :which-key "Roam insert immediately")
  "orc" '(lem/org-roam-capture-task                    :which-key "Roam capture tast")
  "orf" '(org-roam-node-find                           :which-key "Org roam node find")
  "org" '(org-roam-ui-open                             :which-key "Open org roam graph")
  "ori" '(org-roam-node-insert                         :which-key "Org roam node insert")
  "orl" '(org-roam-buffer-togle                        :which-key "Org roam buffer togle")
  "ort" '(:ignore t                                    :which-key "Org roam tag")
  "orta" '(org-roam-tag-add                            :which-key "Org roam tag add")
  "ortr" '(org-roam-tag-remove                         :which-key "Org roam tag remove")
  "ords" '(org-roam-db-sync                            :which-key "Sync org roam db")
  "p"  '(:ignore t                                     :which-key "Projectile")
  "pf" '(projectile-find-file                          :which-key "Projectile find file")
  "ps" '(projectile-switch-project                     :which-key "Projectile switch project")
  "pF" '(consult-ripgrep                               :which-key "Rip grep")
  "pc" '(projectile-compile-project                    :which-key "Compile Project")
  "pd" '(projectile-dired                              :which-key "Projectile dired")
  "s" '(:ignore t                                      :which-key "sync")
  "so" '(lem/sync-org                                  :which-key "Sync org files")
  "sc" '(lem/sync-conf                                 :which-key "Sync config folder")
  "sb" '(org-roam-db-sync                              :which-key "Reload org roam DB")
  "t"  '(:ignore t                                     :which-key "toggles")
  "tw" '(whitespace-mode                               :which-key "whitespace")
  "td" '(lem-write-switch-dictionary                   :which-key "Toggle between dictionaries")
  "tt" '(lem/toggle-transparency                       :which-key "Toggle between transparency states")
  "tl" '(org-toggle-link-display                       :which-key "Toggle org link display")
  "tL" '(display-line-numbers-mode                     :which-key "Toggle display line numbers")
  "tf" '(auto-fill-mode                                :which-key "Toggle autofill mode")
  "r" '(:ignore t                                      :which-key "sudo edit")
  "rf" '(sudo-edit-find-file                           :which-key "Sudo find file")
  "rF" '(sudo=edit                                     :which-key "sudo edit current file")
  "u" '(universal-argument                             :which-key "Universal argument")
  "v" '(:ignore t                                      :which-key "Vterminal")
  "vt" '(multi-vterm                                   :which-key "Open vterm in same window")
  "vT" '(vterm-other-window                            :which-key "Open vterm in other window"))

(lem/leader-key-def
  "g"   '(:ignore t :which-key "git")
  "gs"  'magit-status
  "gd"  'magit-diff-unstaged
  "gc"  'magit-branch-or-checkout
  "gl"   '(:ignore t :which-key "log")
  "glc" 'magit-log-current
  "glf" 'magit-log-buffer-file
  "gb"  'magit-branch
  "gP"  'magit-push-current
  "gp"  'magit-pull-branch
  "gf"  'magit-fetch
  "gF"  'magit-fetch-all
  "gr"  'magit-rebase)

(provide 'clay-general)
;;; clay-general.el ends here
