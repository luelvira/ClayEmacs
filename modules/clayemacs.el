;; -*- lexical-binding: t -*-
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

;; This file has been automatically generated. DO NOT EDIT.
;; Sources are available from https://github.com/luelvira/dotfiles/

;;; Code:

(require 'savehist)
(require 'hl-line)


(use-package dashboard
  :disabled
  :diminish (dashboard-mode)
  :init      ;; tweak dashboard config before loading it
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))
        dashboard-banner-logo-title "Welcome to Emacs!"
        dashboard-set-navigator t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-startup-banner 'logo
        dashboard-center-content nil
        dashboard-items '((recents   . 5)
                          (agenda    . 5 )
                          (projects  . 5))
        dashboard-display-icons-p t ;; display icons on both GUI and terminal
        dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book"))))

(setq backup-by-copying      t   ; instead of renaming current file (clobbers links)
      create-lockfiles       nil
      make-backup-files      t   ; Backup of a file the first time it is saved.
      backup-by-copying      t   ; Don't delink hardlinks
      version-control        t   ; Use version numbers on backups
      delete-old-versions    t   ; Automatically delete excess backups
      kept-new-versions      6   ; how many of the newest versions to keep
      kept-old-versions      5   ; and how many of the old
      auto-save-default      t
      ;; Don't auto-disable auto-save after deleting big chunks. This defeats
      ;; the purpose of a failsafe. This adds the risk of losing the data we
      ;; just deleted, but I believe that's VCS's jurisdiction, not ours.
      auto-save-include-big-deletions t
      require-final-newline           t)

(setq custom-file (expand-file-name "custom.el" private-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror 'nomessage))

(use-package no-littering
  :demand t
  :config
  (let ((backup-dir (no-littering-expand-var-file-name "backup/")))
    (make-directory backup-dir t)
    (setq backup-directory-alist
          `(("\\`/tmp/" . nil)
            ("\\`/dev/shm/" . nil)
            ("." . ,backup-dir)))))

(setq-default inhibit-startup-screen  t
              inhibit-startup-message t
              inhibit-startup-echo-area-message user-full-name)

;; Set encding by default
(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
(prefer-coding-system       'utf-8)     ; Add utf-8 at the front for automatic detection.
(set-terminal-coding-system 'utf-8)     ; Set coding system of terminal output
(set-keyboard-coding-system 'utf-8)     ; Set coding system for keyboard input on TERMINAL
(set-language-environment "English")    ; Set up multilingual environment

(setq native-comp-async-report-warnings-errors nil)
;; Set the right directory to store the native comp cache
(add-to-list
  'native-comp-eln-load-path
  (expand-file-name "eln-cache/" user-emacs-directory))

(setq auto-save-list-file-prefix ; Prefix for generating auto-save-list-file-name
      (expand-file-name ".auto-save-list/.saves-" user-emacs-directory)
      auto-save-default t        ; Auto-save every buffer that visits a file
      auto-save-timeout 20       ; Number of seconds between auto-save
      auto-save-interval 200)    ; Number of keystrokes between auto-saves

(setq history-length 25
      history-delete-duplicates t)
(savehist-mode 1)
;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

(let (message-log-max)
  (savehist-mode))

(setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
              confirm-nonexistent-file-or-buffer nil  ; Ok to visit non existent files
              confirm-kill-emacs #'y-or-n-p)          ; Confirm before kill emacs

(setq-default ad-redefinition-action 'accept     ; Silence warnings for redefinition
              cursor-in-non-selected-windows nil ; Hide the cursor in inactive windows
              fill-column 80                     ; Default line width
              help-window-select t               ; Focus new help windows when opened
              indent-tabs-mode nil               ; space insetead of tabs
              tab-always-indent 'complete        ;first tab and then complete
              tab-width 4
              evil-shift-width tab-width
              inhibit-startup-screen t           ; Disable start-up screen
              sentence-end-double-space nil      ; Use a single space after dots
              truncate-string-ellipsis "…")

(setq split-width-threshold 160
      split-height-threshold nil)

(setq find-file-visit-truename t
      vc-follow-symlinks t)

(setq tramp-default-method "ssh")

(require 'server)
(unless (or is-termux
            (server-running-p))
  (server-start))

(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

(unless is-termux
  (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; By default, Emacs requires you to hit ESC trhee times to escape quit the minibuffer
(global-set-key [escape] 'keyboard-escape-quit)

(setq bookmark-default-file
      (expand-file-name "bookmarks" user-emacs-directory))

(defun lem/go-dotfiles ()
  (interactive)
  (lem/interactive-find-file lem/dotfiles))

(defun lem/go-emacs-config ()
  (interactive)
  (find-file (expand-file-name "config/emacs/config.org" lem/dotfiles)))

(defun lem/go-emacs-init ()
  (interactive)
  (find-file (expand-file-name "init.el" private-emacs-directory)))

(defun lem/go-emacs-modules ()
  (interactive)
  (lem/interactive-find-file (expand-file-name "lisp/" private-emacs-directory)))

(defun lem/jump-dotfiles ()
  (interactive)
  (dired lem/dotfiles))

(defgroup lem ()
  "Group for some personal variables."
  :prefix  'lem
  :version '0.0.1)

(defcustom lem/alpha-value 90
  "The default value of transparency used for the current frame."
  :set (lambda (k v)
         (set-default k v)
         (when (fboundp 'lem/set-background) (lem/set-background)))
  :group 'lem
  :type '(number))

(defun lem/set-background ( &optional frame)
  "The default value of transparency used for the current FRAME."
  (unless is-termux
    (let ((alpha (if (boundp 'lem/alpha-value) lem/alpha-value 100)))
      (let ((tuple `(,alpha . ,alpha)))
        (set-frame-parameter frame 'alpha tuple)
        (add-to-list 'default-frame-alist `(alpha-background . ,lem/alpha-value))))))

(defcustom lem/sync_script_path (let
  ((file-name (expand-file-name "sync.sh" "~/.local/bin/")))
  (if (file-exists-p file-name) file-name nil))
  "The path where the sync file is stored."
  :type 'string
  :group 'lem)

(defun lem/sync (path)
  "Call the sync comand with the project to be syncrhonize.
PATH: is the dir where the git repo is"
  (shell-command-to-string (concat lem/sync_script_path " " path)))

(defun lem/sync-org ()
  "Sync the Org directory with an external script."
  (interactive)
  (lem/sync org-directory))

(defun lem/sync-conf ()
  "Sync the config foler with an external script."
  (interactive)
  (lem/sync lem/dotfiles))

(defun lem/delete-this-file ()
  "Delete the current file and kill the buffer."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename "?"))
            (progn (delete-file filename)
                   (message "File delete")
                   (kill-buffer)))
      (message "Not a file visiting buffer!"))))

(defun lem/rename-this-file ()
  "Rename the current file."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun lem/interactive-find-file (dir)
  (let ((default-directory dir))
    (call-interactively 'find-file)))

(defun lem/reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))

(unless is-termux
  (tool-bar-mode    -1)
  (scroll-bar-mode  -1)
  (set-fringe-mode   0)
  (tooltip-mode     -1)
  (menu-bar-mode    -1)
  (setq-default fringes-outside-margins t))

(setq visible-bell t)
(electric-indent-mode -1)
(electric-pair-mode -1)

;; Reduce the clutter in the fringes; we'd like to reserve that space for more
(setq indicate-buffer-boundaries nil
      indicate-empty-lines nil
      frame-title-format "%b - GNU Emacs"
      icon-title-format frame-title-format
      use-dialog-box nil
      window-divider-default-places       t
      window-divider-default-bottom-width 1
      window-divider-default-right-width  1)

(add-hook 'emacs-startup-hook #'window-divider-mode)

(setq-default dispaly-line-numbers-width 3
              display-line-numbers-widen t)

(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

(setq display-time-format "%H:%M %b %y"
      display-time-default-load-average nil)
(display-time-mode 1)

(use-package doom-modeline
  :disabled
  :hook (after-init . doom-modeline-mode)
  :init
  (setq projectile-dynamic-mode-line nil)
  ;; Set these early so they don't trigger variable watchers
  (setq doom-modeline-bar-width 3
        doom-modeline-github nil
        doom-modeline-mu4e nil
        doom-modeline-minor-modes t
        doom-modeline-persp-name nil
        doom-modeline-major-mode-icon t
        doom-modeline-buffer-file-name-style 'relative-from-project
        ;; Only show file encoding if it's non-UTF-8 and different line endings
        ;; than the current OSes preference
        doom-modeline-icons (display-graphic-p)
        doom-modeline-buffer-encoding 'nondefault
        doom-modeline-default-eol-type 0))

(use-package mood-line
  :config
  (setq mood-line-glyph-alist mood-line-glyphs-fira-code)
  (mood-line-mode))

(use-package diminish)

(use-package minions
  :hook ((doom-modeline-mode mood-line-mode) . minions-mode))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (lem/set-fonts frame)
                (lem/set-background frame)))
  (add-hook 'after-init-hook
            (lambda ()
              (lem/set--fonts)
              (lem/set-background))))

(defun lem/set--fonts ()
  "Function to setup the fonts once the frame is create.
This is required when using the daemon mode"
  (set-face-attribute 'default nil
                      :family lem-default
                      :width 'normal
                      :weight 'normal
                      :height 110)
  (set-face-attribute 'fixed-pitch nil
                      :inherit 'default
                      :weight 'medium
                      :height 1.0
                      :family lem-fixed)
  (set-face-attribute 'variable-pitch nil
                      :family  lem-variable
                      :inherit 'default
                      :weight 'regular))

(defun lem/set-fonts (frame)
  "Function to select the current FRAME when it is created.
Then call the set--fonts function."
  (select-frame frame)
  (lem/set--fonts))

(defconst lem-fixed "FiraCodeNerdFont"
  "Font string for fixed pitch modes.")
(defconst lem-default "FiraCodeNerdFont"
  "Font string for UI fonts.")
(defconst lem-variable "Iosevka Aile"
  "Font string for variable pitch texts.")

;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)
(add-to-list 'default-frame-alist '(family . lem-default))

(defvar lem/ligatures-prog-mode-list
  '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
    ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
    "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
    "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
    "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
    "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
    "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
    "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
    ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
    "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
    "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
    "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
    "\\\\" "://"))

(use-package ligature
  :config
 ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures '(prog-mode org-mode) lem/ligatures-prog-mode-list)
  ;; (ligature-set-ligatures 't lem/ligatures-extra-symbols)
 (global-ligature-mode t))

(use-package nerd-icons :defer t)
(use-package nerd-icons-dired
    :defer t
    :hook
    (dired-mode . nerd-icons-dired-mode))
(use-package nerd-icons-completion
    :defer t
    :config
    (nerd-icons-completion-mode))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (load-theme 'doom-dracula t))

(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'conf-mode-hook #'hl-line-mode)

(use-package rainbow-delimiters
  :init (setq rainbow-delimiters-max-face-count 4)
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

(use-package paren
  :config
  (setq show-paren-delay 0.1
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t)
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

(use-package perspective
  :disabled
  :custom
  (persp-mode-prefix-key (kbd "C-x x"))
  :init (persp-mode)
  :config
  (setq
   persp-state-default-file
   (expand-file-name "sessions" user-emacs-directory))

  ;; Use ibuffer with perspective
  (add-hook
   'ibuffer-hook (lambda ()
                   (persp-ibuffer-set-filter-groups)
                   (unless (eq ibuffer-sorting-mode 'alphabetic)
                     (ibuffer-do-sort-by-alphabetic))))
  ;; Automatically save perspective states to file when Emacs exits.
  (add-hook 'kill-emacs-hook #'persp-state-save))

;; An alternative to perspective

(use-package tabspaces
  :disabled
  :hook (after-init . tabspaces-mode)
  :commands (tabspaces-switch-or-create-workspace
             tabspaces-open-or-create-project-and-workspace)
  :custom
  (tabspaces-use-filtered-buffers-as-default t)
  (tabspaces-default-tab "Default")
  (tabspaces-remove-to-default t)
  (tabspaces-include-buffers '("*scratch*" "*Messages*"))
  ;; sessions
  (tabspaces-session t)
  (tabspaces-session-auto-restore t)
  (tab-bar-new-tab-choice "*scratch*")
  :init
  ;; Filter Buffers for Consult-Buffer
  (with-eval-after-load 'consult
    ;; hide full buffer list (still available with "b" prefix)
    (consult-customize consult--source-buffer :hidden t :default nil)
    ;; set consult-workspace buffer list
    (defvar consult--source-workspace
      (list :name     "Workspace Buffer"
            :narrow   ?w
            :history  'buffer-name-history
            :category 'buffer
            :state    #'consult--buffer-state
            :default  t
            :items    (lambda () (consult--buffer-query
                                  :predicate #'tabspaces--local-buffer-p
                                  :sort 'visibility
                                  :as #'buffer-name)))
      "Set workspace buffer list for consult-buffer.")
    (add-to-list 'consult-buffer-sources 'consult--source-workspace)))

(use-package cape
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)

  ;; No auto-completion or completion-on-quit in eshell
  (defun crafted-completion-corfu-eshell ()
    "Special settings for when using corfu with eshell."
    (setq-local corfu-quit-at-boundary t
                corfu-quit-no-match t
                corfu-auto nil)
    (corfu-mode))
  (add-hook 'eshell-mode-hook #'crafted-completion-corfu-eshell))

(use-package corfu
  :bind (:map corfu-map
              ("C-j" . corfu-next)
              ("C-k" . corfu-previous)
              ("TAB" . corfu-insert))
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-preview-current nil)
  (corfu-quit-at-boundary t)
  (corfu-quit-no-match t)
  :config
  (global-corfu-mode 1)
  (setq corfu-separator ?\s
        corfu-preselect-first nil
        corfu-preselect 'prompt
        tab-always-indent 'complete)
  (defun corfu-enable-in-minibuffer ()
    "Enable Corfu in the minibuffer if `completion-at-point' is bound."
    (when (where-is-internal #'completion-at-point (list (current-local-map)))
      ;; (setq-local corfu-auto nil) ;; Enable/disable auto completion
      (setq-local corfu-echo-delay nil ;; Disable automatic echo and popup
                  corfu-popupinfo-delay nil)
      (corfu-mode 1)))

  (add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer)
  :init
  (global-corfu-mode))

(defun lem/minibuffer-backward-kill (arg)
  "Minibuffer delete up to the parent folder or the last word.
If the minibuffer text is a path, delete the filename, otherwise the last word.
ARG is the minibuffer text."
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
    (delete-backward-char arg)))

(use-package vertico
  :custom (vertico-cycle t)
  :init (vertico-mode)
  :bind (:map vertico-map
              ("M-RET" . vertico-exit-input)
              ("C-j" . vertico-next)
              ("C-k" . vertico-previous)
              ("C-f" . vertico-exit)
              :map minibuffer-local-map ("M-<backspace>" . lem/minibuffer-backward-kill))
  :config
  (setq vertico-resize nil        ; How to resize the Vertico minibuffer window.
        vertico-count 8           ; Maximal number of candidates to show.
        vertico-count-format nil) ; No prefix with number of entries
  (setq-default completion-in-region-function
                (lambda (&rest args)
                  (apply (if vertico-mode
                             #'consult-completion-in-region
                           #'completion--in-region)
                         args))))

(defun lem/get-project-root ()
  (when (fboundp 'projectile-project-root)
    (projectile-project-root)))

(use-package consult
  :demand t
  :bind
  ([remap bookmark-jump]                  . consult-bookmark)
  ([remap goto-line]                      . consult-goto-line)
  ([remap load-theme]                     . consult-theme)
  ([remap recentf-open-files]             . consult-recent-file)
  ([remap switch-to-buffer]               . consult-buffer)
  ([remap switch-to-buffer-other-window]  . consult-buffer-other-window)
  ([remap switch-to-buffer-other-frame]   . consult-buffer-other-frame)
  (("C-s"   . my/consult-line)
   ("C-M-l" . consult-imenu)
   ("C-M-j" . persp-switch-to-buffer*)
   :map minibuffer-local-map
   ("C-r"   . consult-history))
  :custom
  (consult-project-root-function #'lem/get-project-root)
  (completion-in-region-function #'consult-completion-in-region)
  :config
  (recentf-mode +1)
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file))

(defun my/consult-line ()
  "Consult line with live preview"
  (interactive)
  (let ((consult-preview-key 'any)
        (mini-frame-resize 'grow-only)) ;; !! Important
    (consult-line)))

(defun my/consult-goto-line ()
  "Consult goto line with live preview"
  (interactive)
  (let ((consult-preview-key 'any))
    (consult-goto-line)))

(use-package consult-dir
  :straight t
  :bind (([remap list-directory] . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file))
  :custom
  (consult-dir-project-list-function nil))

(use-package marginalia
  :after vertico
  :custom (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :hook (marginalia-mode . #'nerd-icons-completion-marginalia-setup)
  :config
  (setq-default marginalia--ellipsis "…"    ; Nicer ellipsis
                marginalia-align 'right     ; right alignment
                marginalia-align-offset -1) ; one space on the right
  :init
  (marginalia-mode))

(use-package embark
  :config
  ;; Show Embark actions via which-key
  (setq embark-action-indicator
        (lambda (map)
          (which-key--show-keymap "Embark" map nil nil 'no-paging)
          #'which-key--hide-popup-ignore-command)
        embark-become-indicator embark-action-indicator)
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
  :bind
  (("C-;" . embark-act)))

(use-package embark-consult
  :after embark)

(use-package smex
  :config
  (smex-initialize))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))

(use-package dired-single   :after dired)
(use-package dired-ranger   :after dired)
(use-package dired-collapse :after dired)
(use-package dired
  :after evil-collection
  :straight nil
  :config
  (setq dired-listing-swithces "--group-directories-first"
        dired-omit-files "^\\.[^.].*"
        delete-by-moving-to-trash t)
  (autoload 'dired-omit-mode "dired-x")
  (add-hook 'dired-load-hook
            (lambda ()
              (interactive)
              (dired-collapse)))
  (add-hook 'dired-mode-hook
            (lambda () (interactive)
              (dired-omit-mode 1)
              (dired-hide-details-mode 1)
              (hl-line-mode 1)))
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "H" 'dired-omit-mode
    "l" 'dired-single-buffer
    "y" 'dired-ranger-copy
    "X" 'dired-ranger-move
    "p" 'dired-ranger-paste))

(use-package dired-open
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("png" . "sxiv")
                                ("mkv" . "mpv")
                                ("pdf" . "firefox")
                                ("mp4" . "mpv"))))

(use-package peep-dired
  :after t
  :hook (evil-normalize-keymaps . peep-dired-hook)
  :config
    (evil-define-key 'normal peep-dired-mode-map (kbd "C-j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "C-k") 'peep-dired-prev-file))

(use-package project :straight t) ;; There is an error with eglot and project https://emacs.stackexchange.com/a/81908

(use-package projectile
  :straight t
  :ensure t
  :init
  (setq projectile-auto-discover nil
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
        projectile-kill-buffers-filter 'kill-only-files)
  :diminish projectile-mode
  :config (projectile-mode +1))

(use-package counsel-projectile
  :disabled
  :after projectile
  :bind (("C-M-p" . counsel-projectile-find-file))
  :config
  (counsel-projectile-mode))

(if (version< emacs-version "29.0")
  (use-package seq))
(use-package magit)

(use-package git-gutter
  :unless is-termux
  :commands git-gutter:revert-hunk git-gutter:stage-hunk git-gutter:previous-hunk git-gutter:next-hunk
  :hook ((text-mode . git-gutter-mode)
         (prog-mode . git-gutter-mode))
  :custom
  (git-gutter:modified-sign "|")
  (git-gutter:added-sign "+")
  (git-gutter:delete-sign "-")
  :config
  (setq git-gutter:update-interval 0.2))

(use-package git-timemachine
:hook (evil-normalize-keymaps . git-timemachine-hook)
:config
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-j") 'git-timemachine-show-previous-revision)
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-k") 'git-timemachine-show-next-revision))

(use-package git-commit
  :ensure nil
  :preface
  (defun my/git-commit-auto-fill-everywhere ()
    "Ensure that the commit body does not exceed 72 characters."
    (setq fill-column 72)
    (setq-local comment-auto-fill-only-comments nil))
  :hook (git-commit-mode . my/git-commit-auto-fill-everywhere)
  :custom (git-commit-summary-max-length 50))

(setq ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)

(defun dt-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

(add-hook 'ediff-mode-hook 'dt-ediff-hook)


(use-package flycheck
  :straight t
  :defer t
  :diminish
  :init (global-flycheck-mode))


(use-package compile
  :straight nil
  :custom
  (compilation-scroll-output t))

(defun auto-recompile-buffer ()
  (interactive)
  (if (member #'recompile after-save-hook)
      (remove-hook 'after-save-hook #'recompile t)
    (add-hook 'after-save-hook #'recompile nil t)))

(use-package eglot
  :straight t
  :custom
  (eglot-autoshutdown t)
  (eglot-ignored-server-capabilities '(:documentHighlightProvider))
  :config
  (setq eglot-autoshutdown t
        eglot-confirm-server-initiated-edits nil)
  (setq-default eglot-workspace-configuration
                '((haskell
                   (plugin
                    (stan
                     (globalOn . :json-false))))))
  :hook((python-mode . eglot-ensure)
        (web-mode . eglot-ensure)
        (typescript-mode . eglot-ensure)
        (js2-mode . eglot-ensure)
        (typescript-ts-mode . eglot-ensure)
        (tsx-ts-mode-mode . eglot-ensure)
        (haskell-mode . eglot-ensure))
  :commands (eglot eglot-ensure))

(use-package consult-eglot
  :defer t)

(use-package flycheck-eglot
  :hook (eglot-managment-mode .flycheck-eglot-mode))

(defvar clay-python? t
  "Set true to load the python configuration.")

(defvar clay-web? t
  "Set true to load the configuration used in web development.")
(defvar clay-ts? nil
  "Set the var to true to load the configuration for typescript file.")
(defvar clay-react? nil
  "Set the var to true to load the configuration for react files.")
(defvar clay-haskell? t
  "Set the var to true to load the configuration for haskell projects.")


(add-hook 'emacs-lisp-mode-hook  #'(lambda () (setq evil-shift-width 2)))

;; (use-package clojure-mode)
;; (use-package cider
;;   :after clojure-mode)
;; (use-package inf-clojure
;;  :after cider)

(use-package purescript-mode
  :config
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
  (add-hook 'purescript-mode-hook 'flycheck-mode))

(use-package psc-ide
  :hook (purescript-mode . psc-ide-mode)
  :config
  (remove-hook 'company-backends 'company-psc-ide-backend)
  (psc-ide-flycheck-setup))

(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000
        vterm-kill-buffer-on-exit t))

(use-package vterm-toggle
  :after vterm
  :config
  ;; When running programs in Vterm and in 'normal' mode, make sure that ESC
  ;; kills the program as it would in most standard terminal programs.
  (evil-define-key 'normal vterm-mode-map (kbd "<escape>") 'vterm--self-insert)
  (setq vterm-toggle-fullscreen-p nil)
  (setq vterm-toggle-scope 'project)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                     (let ((buffer (get-buffer buffer-or-name)))
                       (with-current-buffer buffer
                         (or (equal major-mode 'vterm-mode)
                             (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                  (display-buffer-reuse-window display-buffer-at-bottom)
                  ;;(display-buffer-reuse-window display-buffer-in-direction)
                  ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                  ;;(direction . bottom)
                  ;;(dedicated . t) ;dedicated is supported in emacs27
                  (reusable-frames . visible)
                  (window-height . 0.3))))

(use-package multi-vterm :after vterm)

(use-package yasnippet
    :defer t
    :config
    (delq 'yas-dropdown-prompt yas-prompt-functions)
    (yas-global-mode 1))

  (use-package yasnippet-snippets)

(use-package doom-snippets
  :after yasnippet
  :straight (doom-snippets :type git :host github :repo "doomemacs/snippets" :files ("*.el" "*")))

(use-package wakatime-mode
  :straight t
  :config
  (global-wakatime-mode))

(use-package activity-watch-mode
:disabled
:straight t
:config
(global-activity-watch-mode))

(defvar clay-syntax? t
  "Non-nil to load the syntax config.")
(defvar clay-gmd? t
  "Non-nil to load the markdown and  github markdown configuration.")
(defvar clay-latex? t
  "Non-nil to load the org-latex configuration.")

(defvar clay-publish? t
  "Non-nil to load the publish configuration.")

(defun zen-mode--activate ()
  "Function to active a free distraction mode."
  (setq visual-fill-column-width 80
        fill-column 80
        visual-fill-column-center-text t
        visual-fill-column-fringes-outside-margins t
        display-line-numbers nil)
  (auto-fill-mode -1)
  (git-gutter-mode -1)
  (visual-fill-column-mode 1))

(defun zen-mode--disable ()
  "Dsable the zen mode and restore the variables to the previous state."
  (visual-fill-column-mode -1)
  (auto-fill-mode 1)
  (kill-local-variable 'visual-fill-column-width)
  (kill-local-variable 'visual-fill-column-center-text)
  (kill-local-variable 'visual-fill-column-fringes-outside-margins)
  (kill-local-variable 'visual-fill-column-extra-text-width)
  (setq display-line-numbers t))

(defgroup zen ()
  "Group for the zen mode variables."
  :group 'lem-write
  :prefix 'zen)

(define-minor-mode zen-mode
  "Toggles local zen-mode."
  :initial nil
  :global nil
  :group 'zen-mode
  (if zen-mode
      (zen-mode--activate)
    (zen-mode--disable)))


(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-enable))

(defconst lem/org-directory
  (concat (cond (is-debian "~/Sync/")
                (is-fedora "~/Sync/")
                (is-termux "~/storage/shared/Documents/")) "Org/"))

(defun lem/org-mode-hook ()
  (variable-pitch-mode)
  (visual-line-mode 1)
  (auto-fill-mode 1)
  (setq evil-auto-indent nil)
  (diminish org-indent-mode))

(use-package org
  :defer t
  :hook ((org-mode . lem/org-mode-hook)
         (org-mode . org-indent-mode))
  :custom
    (org-archive-save-context-info '(time category itags))
  :config
  (setq org-directory lem/org-directory
        org-default-notes-file (concat org-directory "Inbox.org")
        org-log-done 'time
        org-hide-emphasis-markers t
        org-table-convert-region-max-lines 20000
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-cycle-separator-lines 2
        org-refile-targets '((nil :maxlevel . 2)
                             (org-agenda-files :maxlevel . 1))
        org-outline-path-complete-in-steps nil
        org-refile-use-outline-path t
        org-latex-create-formula-image-program 'dvisvgm
        org-link-frame-setup '((file . find-file)) ;; open file in the same window
        org-startup-folded 'showall ;; when emacs set as default the value showeverithing, overwrite custom visibilities
        org-indirect-buffer-display 'current-window
        org-enforce-todo-dependencies t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-tags-columns 0)

(setq org-todo-keywords '((sequence "TODO(t)" "STRT(s)" "BACK(b)" "|" "DONE(d!)")
                          (sequence "|" "HOLD(h)" "CANCELED(c)")))

(defun lem/start-task () 
  "Start a clock when a task change the state from TOOD to IN PROGRESS."
    (when (string= (org-get-todo-state) "STRT")
           (org-clock-in))
    (when (and (string= (org-get-todo-state) "NEXT")
               (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
(add-hook 'org-after-todo-state-change-hook #'lem/start-task)

(setq org-tag-alist
  '((:startgroup)
  ;Put mutually exclusive tags here
  ("@college" . ?C)
  ("@home" . ?H)
  ("@PHD" . ?P)
  ("@UI" . ?U)
  (:endgroup)
  (:startgroup)
  ("INACTIVE" . ?I)
  ("TOC" . ?T)
  ("HIDDEN" . ?F)
  (:endgroup)))

(setq org-use-tag-inheritance t ; I want to keep it active
      org-tags-exclude-from-inheritance '("PROJECT"))

(setq org-agenda-files
      (mapcar (lambda (file)
                (concat org-directory file)) '("Tasks.org" "Habits.org" "Projects.org"))
      org-agenda-window-setup 'current-window
      org-agenda-span 'week
      org-agenda-start-with-log-mode t
      org-agenda-time-in-grid t
      org-agenda-show-current-time-in-grid t
      ;;        org-agenda-start-on-weekday 1
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-log-into-drawer t
      org-columns-default-format "%20CATEGORY(Category) %30ITEM(Task) %4TODO %6Effort(Estim){:} %20SCHEDULED %20DEADLINE %6CLOCKSUM(Clock) %TAGS")

(setq org-clock-persist t)
(org-clock-persistence-insinuate)

(setq org-capture-templates
      `(("t" "Task")
        ("tq" "Task Quick" entry
         (file+headline ,(concat org-directory "Tasks.org") "Inbox")
         "* TODO %?\nAdded at: %U" :empty-lines 1)
        ("tl" "Task With link" entry
         (file+headline ,(concat org-directory "Tasks.org") "Inbox")
         "* TODO %?\nAdded at: %U from %a\n" :empty-lines 1)))

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60
      org-habit-show-all-today nil
      org-habit-show-habits-only-for-today nil)

(setq org-agenda-custom-commands
      `(("d" "Dashboard" 
         ((agenda ""
                  ((org-deadline-warning-days 7)
                   (org-agenda-span 10)
                   (org-agenda-overriding-header "Agenda")
                   ))
          (alltodo ""
                   ((org-agenda-overriding-header "Sort by priority")
                    (org-agenda-sorting-strategy '(priority-down)))
                   (org-agenda-todo-ignore-scheduled 'all)
                   (org-agenda-todo-ignore-scheduled 'all)
                   org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))
         (todo "ACTIVATED"
               ((org-agenda-overriding-header "Next Actions")
                (org-agenda-max-todos nil)))
         (todo "TODO"
               ((org-agenda-overriding-header "Unprocessed Inbox Tasks")
                (org-agenda-files '(,(concat org-directory "Tasks.org")))
                (org-agenda-text-search-extra-files nil)))
         ))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp  . t)
   (python      . t)
   (js          . t)
   (shell       . t)
   (eshell      . t)
   (gnuplot     . t)
   (haskell     . t)
))

(push '("conf-unix" . conf-unix) org-src-lang-modes)
(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("js" . "src js"))
(add-to-list 'org-structure-template-alist '("ts" . "src tsx-ts"))
(add-to-list 'org-structure-template-alist '("ex" . "export"))
(add-to-list 'org-structure-template-alist '("html" . "src html"))
(add-to-list 'org-structure-template-alist '("hs" . "src haskell"))

(use-package org-superstar
  :after org
  :hook (org-mode . (lambda () (org-superstar-mode 1)))
  :config
  (setq org-superstar-remove-leading-stars t
        org-superstar-leading-bullet ?\s
        org-superstar-leading-fallback ?\s
        org-hide-leading-stars nil
        org-superstar-special-todo-items nil
;;        org-superstar-todo-bullet-alist
;;        '(("TODO" . 9744)
;;          ("[ ]"  . 9744)
;;          ("DONE" . 9745)
;;          ("[X]"  . 9745))
        org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")
))

(require 'org-indent)
(set-face-attribute 'org-block           nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table           nil :inherit 'fixed-pitch)
(set-face-attribute 'org-formula         nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code            nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-date            nil :inherit 'fixed-pitch)
(set-face-attribute 'org-indent          nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim        nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line       nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox        nil :inherit 'fixed-pitch)

(setq org-capture-templates
      (append org-capture-templates
              `(("m" "Fondos" table-line
                 (file+headline
                  ,(expand-file-name "Metrics.org" org-directory) "Fondos")
                 "| %U | %^{MSCIEurope} | %^{S&P500} | %^{MSCIWorld} |")
                ("j" "Journals")
                ("jj" "Journal entry" entry
                 (file+olp+datetree
                  ,(expand-file-name "Journal.org" org-directory) "Notes")
                 "\n* %<%H:%m>\n%?" :empty-lines 1)
                ("jl" "Journal with link" entry
                 (file+olp+datetree
                  ,(expand-file-name "Journal.org" org-directory) "Notes")
                 "\n* %<%H:%m>\nFrom: %a\n%?" :empty-lines 1)
                ))))

(defun save-and-update-includes ()
  "Update the line numbers of #+INCLUDE:s in current buffer.
Only looks at INCLUDEs that have either :range-begin or :range-end.
This function does nothing if not in `org-mode', so you can safely
add it to `before-save-hook'."
  (interactive)
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (goto-char (point-min))
      (while (search-forward-regexp
              "^\\s-*#\\+INCLUDE: *\"\\([^\"]+\\)\".*:range-\\(begin\\|end\\)"
              nil 'noerror)
        (let* ((file (expand-file-name (match-string-no-properties 1)))
               lines begin end)
          (forward-line 0)
          (when (looking-at "^.*:range-begin *\"\\([^\"]+\\)\"")
            (setq begin (match-string-no-properties 1)))
          (when (looking-at "^.*:range-end *\"\\([^\"]+\\)\"")
            (setq end (match-string-no-properties 1)))
          (setq lines (decide-line-range file begin end))
          (when lines
            (if (looking-at ".*:lines *\"\\([-0-9]+\\)\"")
                (replace-match lines :fixedcase :literal nil 1)
              (goto-char (line-end-position))
              (insert " :lines \"" lines "\""))))))))

(add-hook 'before-save-hook #'save-and-update-includes)

(defun decide-line-range (file begin end)
  "Visit FILE and decide which lines to include.
BEGIN and END are regexps which define the line range to use."
  (let (l r)
    (save-match-data
      (with-temp-buffer
        (insert-file-contents file)
        (goto-char (point-min))
        (if (null begin)
            (setq l "")
          (search-forward-regexp begin)
          (setq l (line-number-at-pos (match-beginning 0))))
        (if (null end)
            (setq r "")
          (search-forward-regexp end)
          (setq r (1+ (line-number-at-pos (match-end 0)))))
        (format "%s-%s" (+ l 1) (- r 1)))))) ;; Exclude wrapper

(defun set-pomodoro-timer (minutes rest)
  (interactive "nMinutes: \nnRest time: ")
  (setq org-pomodoro-length minutes
        org-pomodoro-short-break-length rest))

(defun lem/set-short-pomodoro ()
  "This function set the default values from the pomodoro method"
  (interactive)
  (setq org-pomodoro-length 25
        org-pomodoro-long-break-frequency 4
        org-pomodoro-short-break-length 5
        org-pomodoro-long-break-length 10))

(defun lem/set-custom-timmers-pomodo ()
  "Function to customize the timmers for the pomodoro clock"
  (interactive)
  (setq org-pomodoro-length 90
        org-pomodoro-long-break-frequency 2
        org-pomodoro-short-break-length 10
        org-pomodoro-long-break-length 20))

(use-package org-pomodoro
  :config
  (setq
   alert-user-configuration
   (quote ((((:category . "org-pomodoro")) libnotify nil)))
   org-pomodoro-clock-break t
   org-pomodoro-manual-break t)
  (lem/set-custom-timmers-pomodo))

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default nil))

(defun lem/insert-auto-tangle-tag ()
  "Insert auto-tangle tag in literature config."
  (interactive)
  (evil-org-open-below 1)
  (insert "#+auto_tangle: t ")
  (evil-force-normal-state))

(use-package org-appear
  :hook (org-mode . org-appear-mode))

(use-package evil-org
  :after org
  :hook ((org-mode . evil-org-mode)
         (org-agenda-mode . evil-org-mode)
         (org-capture-mode . evil-insert-state)
         (evil-org-mode . (lambda () (evil-org-set-key-theme '(navigation todo insert textobjects additional)))))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-ref)
(use-package gnuplot)

;; function to search into the org folder
(defun lem/org-search ()
  (interactive)
  (let ((consult-ripgrep-command "rg --type org --line-buffered --color=always --max-columns=500 --line-number . -e ARG OPTS"))
  (consult-ripgrep org-directory)))

(use-package org-wild-notifier
  :after org
  :custom
  (alert-default-style 'libnotify)
  (org-wild-notifier-notification-title "Agenda Reminder")
  :config (org-wild-notifier-mode))

(use-package org-journal
  :straight t
  :defer t
  :custom
  (org-journal-dir (expand-file-name "Journal" org-directory))
  (org-journal-file-format "%Y-%m-%d")
  (org-journal-enable-encryption nil)
  (org-journal-encrypt-journal nil))

(use-package org-roam
  :config
  (setq org-roam-directory (expand-file-name "roam" org-directory)
        org-roam-completion-everywhere t
        org-roam-db-autosync-mode t
        org-roam-list-files-commands '(fd fdfind rg find)
        org-roam-file-extensions '("org" "md")) ;; needed for md-roam

(setq org-roam-capture-templates
      '(("f" "Fleeting" plain "%?"
         :if-new
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                    "#+TITLE: ${title}\n#+DATE: %U\n#+AUTHOR: %n\n#+filetags: :fleeting:")
         :unnarrowed nil)
        ("P" "Permanent" palin "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+TITLE: ${title}\n#+DATE: %U\n#+filetags: :PERMANENT:\n* ${title}\n\n")
         :unnarrowed t)
        ("d" "default" plain "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n#+author: %n\n")
         :unnarrowed t)
        ("p" "project" plain
         "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
         :unnarrowed t)))

(cl-defmethod org-roam-node-date ((node org-roam-node)) (format-time-string "%Y-%m-%d" (org-roam-node-file-mtime node)))

(setq org-roam-node-display-template
      (concat "${title:*} "
              (propertize "${aliases:10}")
              (propertize "${tags:30}"  'face 'org-tag)
              (propertize "${date:10}"  'face 'org-date)))

(setq org-roam-dailies-capture-templates
  '(("d" "default" entry "* %<%I:%M %p>:\n%?"
:if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+filetags: jouranl\n\n"))))

;; Close org roam package declaration
)

(defun lem/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun lem/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (lem/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))
(defun lem/org-roam-refresh-agenda-list ()
  (interactive)
  (customize-set-variable 'org-agenda-files (delete-dups (append org-agenda-files (lem/org-roam-list-notes-by-tag "Project")))))

(defun lem/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'lem/org-roam-project-finalize-hook)
  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (lambda (node)
     (member "Project" (org-roam-node-tags node)))))

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(defun lem/org-roam-capture-task ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (lem/org-roam-filter-by-tag "Project"))
                     :templates '(
                                  ("p" "project" entry "** TODO %?\nAdded at: %U"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                          ("Tasks")))
                                  ("s" "start now" entry "** TODO %?"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                          ("Tasks"))
                                   :clock-in :clock-resume)
                                  ("m" "Meeting")
                                  ("mp" "Prepare meeting" entry "** %U\n %?"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                          ("Meetings"))
                                   :target (file+olp+datetree "%<%Y%m%d%H%M%S>-${slug}.org" ("Meetings"))))))

                                        ; initialize the functions
(lem/org-roam-refresh-agenda-list)

(defvar lem/bibliography-files (mapcar
   (lambda (file)
     (expand-file-name file org-directory))
   '("bibliography.bib" "phd.bib"))
  "List of the .bib to get the bibliography.")

(use-package citar
  :after (org-roam)
  :custom
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (org-cite-global-bibliography lem/bibliography-files)
  (citar-bibliography lem/bibliography-files)
  :config
  (setq citar-templates
        '((main . "${author editor:30%sn}     ${date year issued:4}     ${title:48}")
          (suffix . "          ${=key= id:15}    ${=type=:12}    ${tags keywords:*}")
          (preview . "${author editor:%etal} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
          (note . "Notes on ${author editor:%etal}, ${title}"))
        bibtex-completion-bibliography lem/bibliography-files))

(use-package citar-org-roam
  :after (citar org-roam)
  :config (citar-org-roam-mode)

(add-to-list 'org-roam-capture-templates
             '("r" "Bibliography reference" plain "* ${citar-title}\n%?"
               :if-new (file+head "%<%Y%m%d%H%M%S>-${citar-citekey}.org"
                                  "#+TITLE: ${citar-citekey}\n#+AUTHOR: ${citar-author}\n#+cite-date: ${citar-date}\n#+filetags: :LITERATURE:\n#+date: %U\n")
               :unnarrowed t) t)

(setq citar-org-roam-note-title-template "${author} - ${title}"
      citar-org-roam-capture-template-key "r"))

(defun lem/import-notes-from-zotero (key &optional _entry)
(interactive (list (citar-select-ref)))
  (let* ((entry (bibtex-completion-get-entry key))
         (note (bibtex-completion-get-value "note" entry ""))
         (pandoc-command "pandoc --from latex --to org")
         result)
    (with-temp-buffer
      (shell-command (format "echo \"%s\" | %s" note pandoc-command)
                     (current-buffer))
      (setq result (buffer-substring-no-properties (point-min) (point-max))))
    (insert result)))

(defun lem/add-acronym (label abbrv full)
  (interactive "sLabel: \nsAccronym: \nsFull text: ")
  (save-excursion
    (re-search-backward "#\\+latex_header" nil t)
    (forward-line)
    (when (not (looking-at "^$"))
      (beginning-of-line)
      (insert "\n")
      (forward-line -1))
    (insert (format "#+latex_header_extra: \\newacronym{%s}{%s}{%s}\n"
                    label abbrv full))
  (write-region
     (format
      "\\newacronym{%s}{%s}{%s}\n"
      label abbrv full)
     nil "~/Sync/Org/roam/glossary.tex" 'append)))

(use-package org-roam-ui)

(use-package denote
  :after org
  :hook (dired-mode . denote-dired-mode-in-directories)
  :config
  (setq denote-directory org-roam-directory
        denote-file-type "org"
        denote-infer-keywords t
        denote-prompts '(title keywords signature)
        denote-dired-directories (list denote-directory)))



(provide 'clayemacs)
;;; clayemacs.el ends here
