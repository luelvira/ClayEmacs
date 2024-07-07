

# Emacs Config


## About

This is my personal configuration for **Emacs**. I have been inspired by other
developers such us:

-   

-   

-   


## About README

This README is exported from `init.org` which contains **references** to the code
blocks that conforms the configuration. The command used to export it is `M-x
org-gfm-export-to-markdown`. This command is part of the package ~~
In [M-EMACS](https://github.com/MatthewZMD/.emacs.d), the author mention that this approach improve the cleanness of the
configuration, and the startup performance from the all in one file used to be use.


## Other options

Emacs allows to export src blocks to a `.el` file and load them. This is a great
option if you would like to describe each part of the configuation and explain a
bit of them. To make them, you need to create a `init.el` file with the following
code.

**Note** When I move to straight there is a bug with org-mode than generate a
conflict with this method. I need to tangle manually all the config to the
`init.el` file and `early-init.el` file respectively.

    (org-babel-load-file
    (expand-file-name
    "config.org"
      user-emacs-directory))


# Starup


## lexical-binding

Lexical binding is a mode that allows to use special features of the languages. It options tell the configuration that works as a program more than just a simple configuration

This will generate a header at the top of the tangled file to indicate it is generated and is not meant to be modified directly.

    ;; -*- lexical-binding: t -*-


# Early init

The early-init file is loaded before any process of emacs, either the package system. So I will configure the directories used by Emacs to prevent the default behaviour which get dirty the configuration folder.

    ;;; early-init.el --- early init file -*- lexical-binding: t -*-

Package initialize occurs automatically, before user-init-file is loaded, but after early-init file. We handle package initialization, so we must prevent Emacs from doing it early! I use straight as package manager, so I need to disable the default behavior before the `package.el` is loaded.


## Startup performance

Make startup faster by reducing the frequency of garbage collection and then use
a hook to measure Emacs startup time.

    ;;; early-init.el --- early init file -*- lexical-binding: t -*-

After Emacs is launched, we should restore the value of this modifications with
a hook. Also, this allows us to keep a profile of the time needed for this
process.

    ;; -*- lexical-binding: t -*-
    (require 'savehist)
    (require 'hl-line)
    
    (setq straight-check-for-modifications nil)
    (defvar bootstrap-version)
    (let ((bootstrap-file
           (expand-file-name
            "straight/repos/straight.el/bootstrap.el"
            (or (bound-and-true-p straight-base-dir)
                user-emacs-directory)))
          (bootstrap-version 7))
      (unless (file-exists-p bootstrap-file)
        (with-current-buffer
            (url-retrieve-synchronously
             "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
             'silent 'inhibit-cookies)
          (goto-char (point-max))
          (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))
    
    ;; Use straight by default
    (straight-use-package 'use-package)
    (setq straight-use-package-by-default t)
    
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
    
    (defconst is-termux
      (string-suffix-p "Android" (string-trim (shell-command-to-string "uname -a")))
      "Boolean variable to determinate if Emacs is runing into termux system.")
    
    (defconst is-ubuntu
      (string= (system-name) "HP-Z1-G8")
      "Boolean variable to determinate if Emacs is runing on work's ubutnu machine.")
    
    (defconst is-debian
      (string= (system-name) "debian")
      "Boolean variable to determinate if Emacs is runing on home's debian machine.")
    
    (defconst is-fedora
      (string= (system-name) "fedora-laptop")
      "Boolean variable to determinate if Emacs is runing on laptop's fedora machine.")
    
    (defvar user-name nil
      "The name to be used in message.")
    
    (setq
      user-mail-address (string-trim (shell-command-to-string "git config --global user.email"))
      user-full-name (string-trim (shell-command-to-string "git config --global user.name"))
      user-name (getenv "USER"))
    
    (defconst lem/dotfiles "~/Documents/git/dotfiles/"
      "The path where the dotfiles git repo is stored.")
    
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
    
    (global-set-key (kbd "C-M-u") 'universal-argument)
    
    (use-package undo-tree
    :init (global-undo-tree-mode 1)
    :config
    (setq undo-tree-auto-save-history nil))
    
    (defun rune/dont-arrow-me-bro ()
      (interactive)
      (message "Arrow keys are bad, you know?"))
    
    (use-package evil
      :preface
      (setq evil-ex-search-vim-style-regexp t
            evil-ex-visual-char-range t  ; column range for ex commands
            evil-mode-line-format 'nil
            ;; more vim-like behavior
            evil-symbol-word-search t
            evil-ex-interactive-search-highlight 'selected-windowa)
      :init
      (setq evil-want-integration t
            evil-want-keybinding nil
            evil-want-C-u-scroll t
            evil-want-C-i-jump t
            evil-undo-system 'undo-tree
            evil-respect-visual-line-mode t)
      :config
      (evil-mode 1)
      ;; Set Emacs state modes
      (dolist (mode '(custom-mode
                      eshell-mode
                      git-rebase-mode
                      erc-mode
                      circe-server-mode
                      circe-chat-mode
                      circe-query-mode
                      term-mode))
        (add-to-list 'evil-emacs-state-modes mode))
      (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
      (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
      (evil-set-initial-state 'messages-buffer-mode 'normal)
      (evil-set-initial-state 'dashboard-mode 'normal)
      ;;; Disable arrow keys in insert mode
      (unless is-termux
        (define-key evil-visual-state-map (kbd "<left>")  'rune/dont-arrow-me-bro)
        (define-key evil-visual-state-map (kbd "<right>") 'rune/dont-arrow-me-bro)
        (define-key evil-visual-state-map (kbd "<down>")  'rune/dont-arrow-me-bro)
        (define-key evil-visual-state-map (kbd "<up>")    'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<left>")  'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<right>") 'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<down>")  'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<up>")    'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<left>")  'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<right>") 'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<down>")  'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<up>")    'rune/dont-arrow-me-bro)))
    
    (use-package evil-collection
      :after evil
      :init
      (setq evil-collection-company-use-tng nil)  ;; Is this a bug in evil-collection?
      :custom
      (evil-collection-outline-bind-tab-p nil)
      :config
      (evil-collection-init))
    
    (use-package evil-numbers
      :after evil
      :config
      (define-key evil-normal-state-map (kbd "g +") 'evil-numbers/inc-at-pt)
      (define-key evil-normal-state-map (kbd "g -") 'evil-numbers/dec-at-pt)
      (define-key evil-visual-state-map (kbd "g +") 'evil-numbers/inc-at-pt-incremental)
      (define-key evil-visual-state-map (kbd "g -") 'evil-numbers/dec-at-pt-incremental))
    
    (use-package evil-surround
      :after evil
      :config
      (global-evil-surround-mode 1))
    
    (use-package evil-nerd-commenter
      :after evil
      :commands (evilnc-comment-operator
                 evilnc-inner-comment
                 evilnc-outer-commenter)
      :bind ([remap comment-line] . evilnc-comment-or-uncomment-lines)
      :config
      (define-key evil-normal-state-map (kbd "C-S-/") 'evilnc-comment-or-uncomment-lines))
    
    (defun enable-evil-pro-mode ()
      "Disable the arrow navigation"
      (dolist (key '("<left>" "<right>" "<down>" "<up>"))
        (define-key evil-visual-state-map (kbd key) 'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd key) 'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd key) 'rune/dont-arrow-me-bro)))
    
    (defun disable-evil-pro-mode ()
       (define-key evil-normal-state-map (kbd "<left>")  'evil-backward-char)
       (define-key evil-normal-state-map (kbd "<right>") 'evil-forward-char)
       (define-key evil-normal-state-map (kbd "<up>")    'evil-previous-line)
       (define-key evil-normal-state-map (kbd "<down>")  'evil-next-line))
    
    (define-minor-mode evil-pro-mode
    "Minor mode to enable or disable the navigation throw the arrows key.
    When the pro mode is enable, you can't navigate with these keys.
    Enable it only for the most braves :;"
      :init-value nil
      :lighter " evil-pro"
      :interactive t
      :group 'lem
      (if evil-pro-mode
          (enable-evil-pro-mode)
        (disable-evil-pro-mode)))
    
    (use-package anzu)
    
    (use-package evil-anzu
      :after evil
      :config (global-anzu-mode +1))
    
    (use-package which-key
      :defer t
      :init (which-key-mode)
      :diminish which-key-mode
      :config
      (setq which-key-idle-delay 0.3
            which-key-side-window-location 'bottom
            which-key-sort-order #'which-key-key-order-alpha
            which-key-allow-imprecise-window-fit nil
            which-key-sort-uppercase-first nil
            which-key-add-column-padding 1
            which-key-max-display-columns nil
            which-key-min-display-lines 6
            which-key-side-window-slot -10
            which-key-side-window-max-height 0.25
            which-key-max-description-length 25
            which-key-allow-imprecise-window-fit nil
            which-key-separator " → " ))
    
    (use-package general
      :config
      (general-evil-setup t)
      (general-create-definer lem/leader-key-def
        :keymaps '(normal insert visual emacs)
        :prefix "SPC"
        :global-prefix "C-SPC"))
    
    (lem/leader-key-def
      "b" '(:ignore t        :which-key "buffers/bookmarks")
      "bl" '(bookmark-jump   :which-key "List bookmarks")
      "bm" '(bookmark-set    :which-key "Set bookmark")
      "bd" '(bookmark-delete :which-key "Delete bookmark")
      "bw" '(bookmark-save   :which-key "Save current bookmark to bookmark file")
      "br" '(revert-buffer   :whick-key "Revert buffer")
      "bi" '(switch-to-buffer     :which-key "Switch buffer")
      "bk" '(kill-current-buffer  :whick-key "Kill current buffer")
      "bn" '(next-buffer          :whick-key "Goto next buffer")
      "bp" '(previous-buffer      :whick-key "Goto previous-buffer buffer")
      "bs" '(save-buffer          :whick-key "Save current buffer")
      "fD" '(lem/delete-this-file :which-key "Delete current file")
      "fR" '(lem/rename-this-file :which-key "Rename current file")
      "ER" '(lem/reload-init-file :which-key "Reload init file")
      "e" '(:ignore t        :which-key "Eshell/Evaluate")
      "eb" '(eval-buffer     :which-key "Evaluate elisp in buffer")
      "ed" '(eval-defun      :which-key "Evaluate defun containing or after point")
      "ee" '(eval-expression :which-key "Evaluate and elisp expression")
      "el" '(eval-last-sexp  :which-key "Evaluate elisp expression before point")
      "er" '(eval-region     :which-key "Evaluate elisp in region")
      "fp" '(lem/go-dotfiles       :which-key "Config")
      "fe" '(:ignore t             :which-key "Emacs files")
      "fec" '(lem/go-emacs-config  :which-key "Emacs Config file")
      "fei" '(lem/go-emacs-init    :which-key "Emacs init file")
      "fem" '(lem/go-emacs-modules :which-key "Custom libraries")
      "d"  '(:ignore t          :which-key "Dired")
      "dd" '(dired              :which-key "Open dired")
      "dj" '(dired-jump         :which-key "Dired jump to current")
      "dp" '(lem/jump-dotfiles  :which-key "Go to dotfiles folder")
      "f" '(:ignore t             :which-key "Files")
      "fD" '(lem/delete-this-file :which-key "Delete current file")
      "fd" '(find-grep-dired      :whick-key "Search for string in files in DIR")
      "ff" '(find-file            :which-key "Find files")
      "fr" '(recentf-open-files   :which-key "Recent files")
      "fR" '(lem/rename-this-file :which-key "Rename current file")
      "o"   '(:ignore t                                           :which-key "org mode")
      "ol"  '(:ignore t                                           :which-key "Link")
      "oli" '(org-insert-link                                     :which-key "insert link")
      "ols" '(org-store-link                                      :which-key "store link")
      "oN"  '(org-toggle-narrow-to-subtree                        :which-key "toggle narrow")
      "os"  '(lem/org-search                                      :which-key "search notes")
      "oa"  '(org-agenda                                          :which-key "Status")
      "oc"  '(org-capture t                                       :which-key "Capture")
      "oC"  '(:ignore t                                           :which-key "Org clock")
      "oCe" '(org-set-effort                                      :which-key "Org set effort")
      "oCg" '(org-clock-goto                                      :which-key "Go ot the last clock active")
      "oCi" '(org-clock-in                                        :which-key "Clock in in the current task")
      "oCI" '(org-clock-in-last                                   :which-key "Clock-in the last task")
      "oCo" '(org-clock-out                                       :which-key "Clock-out current clock")
      "on"  '((lambda () (interactive) (lem/interactive-find-file org-directory))        :which-key "Notes")
      "op"  '(:ignore t                                           :which-key "Pomodoro")
      "ops" '(org-pomodoro                                        :whick-key "Start org pomodoro")
      "opt" '(set-pomodoro-timer                                  :which-key "Set pomodoro timer")
      "ot"  '(:ignore t                                           :which-key "Insert time stamp")
      "ots" '(org-time-stamp                                      :which-key "Insert active time stamp")
      "oti" '(org-time-stamp-inactive                             :which-key "Insert inactive stamp")
      "or"  '(:ignore t                       :which-key "Org roam")
      "orI" '(org-roam-node-insert-immediate  :which-key "Roam insert immediately")
      "orc" '(lem/org-roam-capture-task       :which-key "Roam capture tast")
      "orf" '(org-roam-node-find              :whick-key "Org roam node find")
      "org" '(org-roam-ui-open                :whick-key "Open org roam graph")
      "ori" '(org-roam-node-insert            :whick-key "Org roam node insert")
      "orl" '(org-roam-buffer-togle           :which-key "Org roam buffer togle")
      "ort" '(:ignore t                       :which-key "Org roam tag")
      "orta" '(org-roam-tag-add               :which-key "Org roam tag add")
      "ortr" '(org-roam-tag-remove            :which-key "Org roam tag remove")
      "ords" '(org-roam-db-sync               :which-key "Sync org roam db")
      "p"  '(:ignore t                  :which-key "Projectile")
      "pf" '(projectile-find-file       :which-key "Projectile find file")
      "ps" '(projectile-switch-project  :which-key "Projectile switch project")
      "pF" '(consult-ripgrep            :which-key "Rip grep")
      "pc" '(projectile-compile-project :which-key "Compile Project")
      "pd" '(projectile-dired           :which-key "Projectile dired")
      "s" '(:ignore t      :which-key "sync")
      "so" '(lem/sync-org  :which-key "Sync org files")
      "sc" '(lem/sync-conf :which-key "Sync config folder")
      "sb" '(org-roam-db-sync :whick-key "Reload org roam DB")
      "t"  '(:ignore t                   :which-key "toggles")
      "tw" '(whitespace-mode             :which-key "whitespace")
      "td" '(lem-write-switch-dictionary :which-key "Toggle between dictionaries")
      "tt" '(lem/toggle-transparency     :which-key "Toggle between transparency states")
      "tl" '(org-toggle-link-display     :which-key "Toggle org link display")
      "tL" '(display-line-numbers-mode   :which-key "Toggle display line numbers")
      "tf" '(auto-fill-mode              :which-key "Toggle autofill mode")
      "r" '(:ignore t :which-key "sudo edit")
      "rf" '(sudo-edit-find-file :which-key "Sudo find file")
      "rF" '(sudo=edit :which-key "sudo edit current file")
      "u" '(universal-argument :which-key "Universal argument")
      "v" '(:ignore t            :which-key "Vterminal")
      "vt" '(multi-vterm         :which-key "Open vterm in same window")
      "vT" '(vterm-other-window  :which-key "Open vterm in other window"))
    
    (use-package perspective
      :custom
      (persp-mode-prefix-key (kbd "C-x x"))
      :init (persp-mode)
      :config
      (setq persp-state-default-file (expand-file-name "sessions" user-emacs-directory)))
    ;; Use ibuffer with perspective
    
    (add-hook
     'ibuffer-hook (lambda ()
                     (persp-ibuffer-set-filter-groups)
                     (unless (eq ibuffer-sorting-mode 'alphabetic)
                       (ibuffer-do-sort-by-alphabetic))))
    
    ;; Automatically save perspective states to file when Emacs exits.
    (add-hook 'kill-emacs-hook #'persp-state-save)
    
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
      "When minibuffer is completing a file name delete up to parent
      folder, otherwise delete a word"
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
    
    (use-package projectile
      :init
      (setq projectile-auto-discover nil
            projectile-globally-ignored-files '(".DS_Store" "TAGS")
            projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
            projectile-kill-buffers-filter 'kill-only-files)
      :diminish projectile-mode
      :config (projectile-mode +1)
      :demand t)
    
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
    
    (use-package flycheck
      :straight t
      :defer t
      :diminish
      :init (global-flycheck-mode))
    
    (use-package origami
      :hook (prog-mode . origami-mode))
    
    (use-package subword
      :config (global-subword-mode 1))
    
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
            (haskell-mode . eglot-ensure))
      :commands (eglot eglot-ensure))
    
    (use-package consult-eglot
      :defer t)
    
    (use-package flycheck-eglot
      :hook (eglot-managment-mode .flycheck-eglot-mode))
    
    (use-package python-mode
      :init
      (setq python-indent-guess-indent-offset t
            python-indent-guess-indent-offset-verbose nil
            python-shell-interpreter "python3"))
    
    (use-package pyvenv
      :init (setenv "WORKON_HOME" "~/.pyenv/versions")
      :config
      (pyvenv-mode 1)
      (add-hook 'python-mode-local-vars-hook #'pyvenv-track-virtualenv)
      (add-to-list 'global-mode-string
                   '(pyvenv-virtual-env-name (" venv:" pyvenv-virtual-env-name " "))
                   'append))
    
    (use-package lsp-pyright :ensure t)
    
    (defun lem/js-indentation ()
      "setup the default indent for javascript files."
      (setq js-chain-indent t
            ;; These have become standard in the JS community
            js-indent-level lem/js-indentation-value
            js2-basic-offset js-indent-level
            typescript-indent-level js-indent-level
            evil-shift-width js-indent-level
            tab-width js-indent-level))
    
    (defcustom lem/js-indentation-value 2
      "The default value for indent javascript and typescript files."
      :set (lambda (k v) (set-default k v) (lem/js-indentation))
      :group 'lem
      :type 'number)
    
    (use-package js2-mode
      :mode "\\.jsx?\\'"
      :ensure flycheck
      :hook ((js2-mode . js2-imenu-extras-mode)
             (js2-mode . prettier-js-mode)
             (js2-mode . lem/js-indentation))
      :config
      (setq 
       ;; let flycheck handle this
       js2-mode-show-parse-errors nil
       js2-mode-show-strict-warnings nil
       ;; Flycheck provides these features, so disable them: conflicting with
       ;; the eslint settings.
       js2-strict-missing-semi-warning nil)
       ;; Use js2-mode for Node scripts
       (add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode)))
    
    (use-package prettier-js
      :custom (prettier-js-args '("--print-width" "100"
                                  "--single-quote" "true"
                                  "--trailing-comma" "all"))
      :config
      (setq prettier-js-show-errors nil))
    
    (use-package js2-refactor
      :hook ((js2-mode rjsx-mode) . js2-refactor-mode))
    
    (use-package typescript-mode
      :ensure flycheck
      :hook ((typescript-mode . prettier-js-mode))
      :mode ("\\.\\(ts\\|tsx\\)\\'")
      :custom
      ;; TSLint is depreciated in favor of ESLint.
      (flycheck-disable-checker 'typescript-tslint)
      (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
      (typescript-indent-level lem/js-indentation-value)
      :config
      (flycheck-add-mode 'javascript-eslint 'typescript-mode))
    
    (use-package rjsx-mode)
    
    (defun lem/web-indentation ()
      "Setup the indentation for the web mode."
      (setq web-mode-markup-indent-offset lem/web-indentation-value ;; for html
            web-mode-css-indent-offset    lem/web-indentation-value ;; for css
            web-mode-code-indent-offset   lem/js-indentation-value  ;; for script/code
            web-mode-enable-auto-pairing  t
            web-mode-style-padding        lem/web-indentation-value
            web-mode-script-padding       lem/js-indentation-value))
    
    (defcustom lem/web-indentation-value 2
      "Default value of indentation for web mode.
    Default value is 2 following the standards."
      :set (lambda (k v) (set-default k v) (lem/web-indentation))
      :group 'lem
      :type 'number)
    
    (use-package web-mode
      :mode "(\\.html?"
      :config
      (lem/web-indentation))
    
    (use-package simple-httpd :defer t)
    (use-package impatient-mode :defer t)
    (use-package skewer-mode :defer t)
    
    (use-package rainbow-mode
      :hook ((css-mode sass-mode) . rainbow-mode))
    (use-package sass-mode)
    
    (add-hook 'emacs-lisp-mode-hook  #'(lambda () (setq evil-shift-width 2)))
    
    (use-package clojure-mode)
    (use-package cider
      :after clojure-mode)
    (use-package inf-clojure
      :after cider)
    
    (use-package haskell-mode
      :config
      (setq haskell-process-suggest-remove-import-lines t
            haskell-process-auto-import-loaded-modules t
            haskell-process-show-overlays nil
            haskell-process-type 'cabal-repl
    ))
    
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
    
    (use-package visual-fill-column)
    
    (use-package auctex)
    (use-package cdlatex)
    
    (defgroup lem-write ()
      "Lem group contains the default vars and function used in this module."
      :group 'lem
      :prefix "lem-write-")
    
    (defcustom lem-write-dictionaries-list '("en_US" "es_ES")
      "List of dictionaries used for spell checking."
      :type 'list
      :group 'lem-write)
    
    (defcustom lem-write-langtool-p t
      "Whether langtool should be used or not."
      :type 'bool
      :group 'lem-write)
    
    (defcustom lem-write-langtool-path "~/.local/lib/languageTool/LanguageTool-6.3/languagetool-commandline.jar"
      "Path where the langtool jar is stored."
      :type 'string
      :group 'lem-write
      :set (lambda (k v)
             (set-default k v)
             (when (fboundp 'langtool-language-tool-jar) (setq langtool-language-tool-jar v))))
    
    (defvar lem-write-dictionaries-pos 0)
    
    (defmacro inc (var)
      "Macro to increment VAR using modular arithmetic."
      `(setq ,var (mod (+ 1 ,var) (length lem-write-dictionaries-list))))
    
    (defun lem-write-switch-dictionary ()
      "Function to iterate over `lem-write-dictionaries-list'."
      (interactive)
      (let* ((dic ispell-current-dictionary)
             (change (nth (inc lem-write-dictionaries-pos) lem-write-dictionaries-list)))
        (ispell-change-dictionary change)
        (message "Dictionary switched from %s to %s" dic change)))
    
    (defun lem-write-text-mode-setup ()
      (interactive)
      (setq evil-auto-indent nil)
      (variable-pitch-mode 1)
      (auto-fill-mode 1))
    
    (add-hook 'text-mode-hook 'lem-write-text-mode-setup)
    
    (use-package flyspell
      :config
      (when
          (file-exists-p "/usr/bin/hunspell")
        (setq ispell-program-name "hunspell"))
      (setq ispell-current-dictionary (nth lem-write-dictionaries-pos lem-write-dictionaries-list))
      :hook (text-mode . flyspell-mode)
      :bind (("M-<f7>" . flyspell-buffer)
             ("<f7>"   . flyspell-word)
             ("C-;"    . flyspell-auto-correct-previous-word))
      ("C-c n d" . lem-write-switch-dictionary))
    
    (when lem-write-langtool-p
      (use-package langtool
      :config
      (setq langtool-language-tool-jar lem-write-langtool-path
            langtool-default-language (nth lem-write-dictionaries-pos lem-write-dictionaries-list))))
    
    (use-package markdown-mode
      :straight t
      :mode ("\\.mdx?\\'" . gfm-mode)
      :config
      (setq markdown-command "marked"))
    
    (defun markdown-html (buffer)
      (princ (with-current-buffer buffer
               (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>"
                       (buffer-substring-no-properties (point-min) (point-max))))
             (current-buffer)))
    
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
    
    (with-eval-after-load 'ox-latex
      (setq org-cite-biblatex-options 
            "backend=biber, style=ieee, isbn=false,sortcites, maxbibnames=5, minbibnames=1"
            ;; delete unwanted file extensions after latexMK
            org-latex-logfiles-extensions
            (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "xmpi" "run.xml" "bcf" "acn" "acr" "alg" "glg" "gls" "ist")))
    
    
      (add-to-list 'org-latex-classes '("org-plain-latex"
                                        "\\documentclass[11pt]{article}
    [NO-DEFAULT-PACKAGES]
    [NO-PACKAGES]
    \\renewcommand{\\baselinestretch}{1.15}
    \\parskip=6pt
    \\renewcommand{\\familydefault}{\\sfdefault}"
                                        ("\\section{%s}" . "\\section*{%s}")
                                        ("\\subsection{%s}" . "\\subsection*{%s}")
                                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
      (add-to-list 'org-latex-classes '("altacv" "\\documentclass[10pt,a4paper,ragged2e,withhyper]{altacv}
    % Change the page layout if you need to
    \\geometry{left=1.25cm,right=1.25cm,top=1.5cm,bottom=1.5cm,columnsep=1.2cm}
    
    % Use roboto and lato for fonts
    \\renewcommand{\\familydefault}{\\sfdefault}
    
    % Change the colours if you want to
    \\definecolor{SlateGrey}{HTML}{2E2E2E}
    \\definecolor{LightGrey}{HTML}{666666}
    \\definecolor{DarkPastelRed}{HTML}{450808}
    \\definecolor{PastelRed}{HTML}{8F0D0D}
    \\definecolor{GoldenEarth}{HTML}{E7D192}
    \\colorlet{name}{black}
    \\colorlet{tagline}{PastelRed}
    \\colorlet{heading}{DarkPastelRed}
    \\colorlet{headingrule}{GoldenEarth}
    \\colorlet{subheading}{PastelRed}
    \\colorlet{accent}{PastelRed}
    \\colorlet{emphasis}{SlateGrey}
    \\colorlet{body}{LightGrey}
    
    % Change some fonts, if necessary
    \\renewcommand{\\namefont}{\\Huge\\rmfamily\\bfseries}
    \\renewcommand{\\personalinfofont}{\\footnotesize}
    \\renewcommand{\\cvsectionfont}{\\LARGE\\rmfamily\\bfseries}
    \\renewcommand{\\cvsubsectionfont}{\\large\\bfseries}
    
    % Change the bullets for itemize and rating marker
    % for \cvskill if you want to
    \\renewcommand{\\itemmarker}{{\\small\\textbullet}}
    \\renewcommand{\\ratingmarker}{\\faCircle}
    "
    
                                        ("\\cvsection{%s}" . "\\cvsection*{%s}")))
    
    (add-to-list 'org-latex-classes '("moderncv"
    "\\documentclass{moderncv}
    \\usepackage[spanish]{babel}
    \\moderncvstyle{classic}
    \\moderncvcolor{green}
    \\renewcommand{\\familydefault}{\\sfdefault}
    \\usepackage[utf8]{inputenc}
    
    % Social icons
    \\social[linkedin]{lucas-elvira-martin}
    \\social[github]{luelvira}
    "))
    
      (defun my-latex-filter-removeOrgAutoLabels (text backend info)
        "Org-mode automatically generates labels for headings despite explicit use of `#+LABEL`. This filter forcibly removes all automatically generated org-labels in headings."
        (when (org-export-derived-backend-p backend 'latex)
          (replace-regexp-in-string "\\\\label{sec:org[a-f0-9]+}\n" "" text)))
    
      (add-to-list 'org-export-filter-headline-functions
                   'my-latex-filter-removeOrgAutoLabels))
    
    (use-package toc-org
      :commands toc-org-enable
      :hook (org-mode . toc-org-enable))
    
    (defconst lem/org-directory
      (concat (cond (is-debian "~/Sync/")
                    (is-fedora "~/Documents/")
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
            )
    
    (setq 
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
     '((emacs-lisp . t)
       (python . t)
       (js . t)
       (shell . t)
       (eshell . t)
       (gnuplot . t)))
    
    (push '("conf-unix" . conf-unix) org-src-lang-modes)
    (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
    
    ;; This is needed as of Org 9.2
    (require 'org-tempo)
    
    (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
    (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
    (add-to-list 'org-structure-template-alist '("py" . "src python"))
    (add-to-list 'org-structure-template-alist '("js" . "src js"))
    (add-to-list 'org-structure-template-alist '("ex" . "export"))
    (add-to-list 'org-structure-template-alist '("html" . "src html"))
    
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
                     "| %U | %^{fondo1} | %^{fondo2} |")
                    ("j" "Journals")
                    ("jj" "Journal entry" entry
                     (file+olp+datetree
                      ,(expand-file-name "Journal.org" org-directory) "Notes")
                     "\n* %<%H:%m>\n%?" :empty-lines 1)
                    ("jl" "Journal with link" entry
                     (file+olp+datetree
                      ,(expand-file-name "Journal.org" org-directory) "Notes")
                     "\n* %<%H:%m>\nFrom: %a\n%?" :empty-lines 1)
                    )))
    
    )
    
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
                                      ("mp" "Prepare meeting" entry "** Notes\n %?"
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
          citar-org-roam-capture-template-key "r")
    
    )
    
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
         nil "~/Documents/Org/roam/glossary.tex" 'append)))
    
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

Also, we can prevent launch the hook associated with some files modification in
startup and reenable it after all the process is completed. From [MatthewZMD](https://github.com/MatthewZMD/.emacs.d)

> Every file opened and loaded by Emacs will run through this list to check for a proper handler for the file, but during startup, it won’t need any of them.

    ;;; early-init.el --- early init file -*- lexical-binding: t -*-


## Disable unnecessary interfaces

Before the windows is created, we can disable some components to prevent it renders

    ;;; early-init.el --- early init file -*- lexical-binding: t -*-


# Init file


## Load Path

All the configuration files are stored in `modules/` folder, so they need to be added to `load-path` variable

    ;; -*- lexical-binding: t -*-
    (require 'savehist)
    (require 'hl-line)
    
    (setq straight-check-for-modifications nil)
    (defvar bootstrap-version)
    (let ((bootstrap-file
           (expand-file-name
            "straight/repos/straight.el/bootstrap.el"
            (or (bound-and-true-p straight-base-dir)
                user-emacs-directory)))
          (bootstrap-version 7))
      (unless (file-exists-p bootstrap-file)
        (with-current-buffer
            (url-retrieve-synchronously
             "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
             'silent 'inhibit-cookies)
          (goto-char (point-max))
          (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))
    
    ;; Use straight by default
    (straight-use-package 'use-package)
    (setq straight-use-package-by-default t)
    
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
    
    (defconst is-termux
      (string-suffix-p "Android" (string-trim (shell-command-to-string "uname -a")))
      "Boolean variable to determinate if Emacs is runing into termux system.")
    
    (defconst is-ubuntu
      (string= (system-name) "HP-Z1-G8")
      "Boolean variable to determinate if Emacs is runing on work's ubutnu machine.")
    
    (defconst is-debian
      (string= (system-name) "debian")
      "Boolean variable to determinate if Emacs is runing on home's debian machine.")
    
    (defconst is-fedora
      (string= (system-name) "fedora-laptop")
      "Boolean variable to determinate if Emacs is runing on laptop's fedora machine.")
    
    (defvar user-name nil
      "The name to be used in message.")
    
    (setq
      user-mail-address (string-trim (shell-command-to-string "git config --global user.email"))
      user-full-name (string-trim (shell-command-to-string "git config --global user.name"))
      user-name (getenv "USER"))
    
    (defconst lem/dotfiles "~/Documents/git/dotfiles/"
      "The path where the dotfiles git repo is stored.")
    
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
    
    (global-set-key (kbd "C-M-u") 'universal-argument)
    
    (use-package undo-tree
    :init (global-undo-tree-mode 1)
    :config
    (setq undo-tree-auto-save-history nil))
    
    (defun rune/dont-arrow-me-bro ()
      (interactive)
      (message "Arrow keys are bad, you know?"))
    
    (use-package evil
      :preface
      (setq evil-ex-search-vim-style-regexp t
            evil-ex-visual-char-range t  ; column range for ex commands
            evil-mode-line-format 'nil
            ;; more vim-like behavior
            evil-symbol-word-search t
            evil-ex-interactive-search-highlight 'selected-windowa)
      :init
      (setq evil-want-integration t
            evil-want-keybinding nil
            evil-want-C-u-scroll t
            evil-want-C-i-jump t
            evil-undo-system 'undo-tree
            evil-respect-visual-line-mode t)
      :config
      (evil-mode 1)
      ;; Set Emacs state modes
      (dolist (mode '(custom-mode
                      eshell-mode
                      git-rebase-mode
                      erc-mode
                      circe-server-mode
                      circe-chat-mode
                      circe-query-mode
                      term-mode))
        (add-to-list 'evil-emacs-state-modes mode))
      (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
      (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
      (evil-set-initial-state 'messages-buffer-mode 'normal)
      (evil-set-initial-state 'dashboard-mode 'normal)
      ;;; Disable arrow keys in insert mode
      (unless is-termux
        (define-key evil-visual-state-map (kbd "<left>")  'rune/dont-arrow-me-bro)
        (define-key evil-visual-state-map (kbd "<right>") 'rune/dont-arrow-me-bro)
        (define-key evil-visual-state-map (kbd "<down>")  'rune/dont-arrow-me-bro)
        (define-key evil-visual-state-map (kbd "<up>")    'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<left>")  'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<right>") 'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<down>")  'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd "<up>")    'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<left>")  'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<right>") 'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<down>")  'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd "<up>")    'rune/dont-arrow-me-bro)))
    
    (use-package evil-collection
      :after evil
      :init
      (setq evil-collection-company-use-tng nil)  ;; Is this a bug in evil-collection?
      :custom
      (evil-collection-outline-bind-tab-p nil)
      :config
      (evil-collection-init))
    
    (use-package evil-numbers
      :after evil
      :config
      (define-key evil-normal-state-map (kbd "g +") 'evil-numbers/inc-at-pt)
      (define-key evil-normal-state-map (kbd "g -") 'evil-numbers/dec-at-pt)
      (define-key evil-visual-state-map (kbd "g +") 'evil-numbers/inc-at-pt-incremental)
      (define-key evil-visual-state-map (kbd "g -") 'evil-numbers/dec-at-pt-incremental))
    
    (use-package evil-surround
      :after evil
      :config
      (global-evil-surround-mode 1))
    
    (use-package evil-nerd-commenter
      :after evil
      :commands (evilnc-comment-operator
                 evilnc-inner-comment
                 evilnc-outer-commenter)
      :bind ([remap comment-line] . evilnc-comment-or-uncomment-lines)
      :config
      (define-key evil-normal-state-map (kbd "C-S-/") 'evilnc-comment-or-uncomment-lines))
    
    (defun enable-evil-pro-mode ()
      "Disable the arrow navigation"
      (dolist (key '("<left>" "<right>" "<down>" "<up>"))
        (define-key evil-visual-state-map (kbd key) 'rune/dont-arrow-me-bro)
        (define-key evil-normal-state-map (kbd key) 'rune/dont-arrow-me-bro)
        (define-key evil-insert-state-map (kbd key) 'rune/dont-arrow-me-bro)))
    
    (defun disable-evil-pro-mode ()
       (define-key evil-normal-state-map (kbd "<left>")  'evil-backward-char)
       (define-key evil-normal-state-map (kbd "<right>") 'evil-forward-char)
       (define-key evil-normal-state-map (kbd "<up>")    'evil-previous-line)
       (define-key evil-normal-state-map (kbd "<down>")  'evil-next-line))
    
    (define-minor-mode evil-pro-mode
    "Minor mode to enable or disable the navigation throw the arrows key.
    When the pro mode is enable, you can't navigate with these keys.
    Enable it only for the most braves :;"
      :init-value nil
      :lighter " evil-pro"
      :interactive t
      :group 'lem
      (if evil-pro-mode
          (enable-evil-pro-mode)
        (disable-evil-pro-mode)))
    
    (use-package anzu)
    
    (use-package evil-anzu
      :after evil
      :config (global-anzu-mode +1))
    
    (use-package which-key
      :defer t
      :init (which-key-mode)
      :diminish which-key-mode
      :config
      (setq which-key-idle-delay 0.3
            which-key-side-window-location 'bottom
            which-key-sort-order #'which-key-key-order-alpha
            which-key-allow-imprecise-window-fit nil
            which-key-sort-uppercase-first nil
            which-key-add-column-padding 1
            which-key-max-display-columns nil
            which-key-min-display-lines 6
            which-key-side-window-slot -10
            which-key-side-window-max-height 0.25
            which-key-max-description-length 25
            which-key-allow-imprecise-window-fit nil
            which-key-separator " → " ))
    
    (use-package general
      :config
      (general-evil-setup t)
      (general-create-definer lem/leader-key-def
        :keymaps '(normal insert visual emacs)
        :prefix "SPC"
        :global-prefix "C-SPC"))
    
    (lem/leader-key-def
      "b" '(:ignore t        :which-key "buffers/bookmarks")
      "bl" '(bookmark-jump   :which-key "List bookmarks")
      "bm" '(bookmark-set    :which-key "Set bookmark")
      "bd" '(bookmark-delete :which-key "Delete bookmark")
      "bw" '(bookmark-save   :which-key "Save current bookmark to bookmark file")
      "br" '(revert-buffer   :whick-key "Revert buffer")
      "bi" '(switch-to-buffer     :which-key "Switch buffer")
      "bk" '(kill-current-buffer  :whick-key "Kill current buffer")
      "bn" '(next-buffer          :whick-key "Goto next buffer")
      "bp" '(previous-buffer      :whick-key "Goto previous-buffer buffer")
      "bs" '(save-buffer          :whick-key "Save current buffer")
      "fD" '(lem/delete-this-file :which-key "Delete current file")
      "fR" '(lem/rename-this-file :which-key "Rename current file")
      "ER" '(lem/reload-init-file :which-key "Reload init file")
      "e" '(:ignore t        :which-key "Eshell/Evaluate")
      "eb" '(eval-buffer     :which-key "Evaluate elisp in buffer")
      "ed" '(eval-defun      :which-key "Evaluate defun containing or after point")
      "ee" '(eval-expression :which-key "Evaluate and elisp expression")
      "el" '(eval-last-sexp  :which-key "Evaluate elisp expression before point")
      "er" '(eval-region     :which-key "Evaluate elisp in region")
      "fp" '(lem/go-dotfiles       :which-key "Config")
      "fe" '(:ignore t             :which-key "Emacs files")
      "fec" '(lem/go-emacs-config  :which-key "Emacs Config file")
      "fei" '(lem/go-emacs-init    :which-key "Emacs init file")
      "fem" '(lem/go-emacs-modules :which-key "Custom libraries")
      "d"  '(:ignore t          :which-key "Dired")
      "dd" '(dired              :which-key "Open dired")
      "dj" '(dired-jump         :which-key "Dired jump to current")
      "dp" '(lem/jump-dotfiles  :which-key "Go to dotfiles folder")
      "f" '(:ignore t             :which-key "Files")
      "fD" '(lem/delete-this-file :which-key "Delete current file")
      "fd" '(find-grep-dired      :whick-key "Search for string in files in DIR")
      "ff" '(find-file            :which-key "Find files")
      "fr" '(recentf-open-files   :which-key "Recent files")
      "fR" '(lem/rename-this-file :which-key "Rename current file")
      "o"   '(:ignore t                                           :which-key "org mode")
      "ol"  '(:ignore t                                           :which-key "Link")
      "oli" '(org-insert-link                                     :which-key "insert link")
      "ols" '(org-store-link                                      :which-key "store link")
      "oN"  '(org-toggle-narrow-to-subtree                        :which-key "toggle narrow")
      "os"  '(lem/org-search                                      :which-key "search notes")
      "oa"  '(org-agenda                                          :which-key "Status")
      "oc"  '(org-capture t                                       :which-key "Capture")
      "oC"  '(:ignore t                                           :which-key "Org clock")
      "oCe" '(org-set-effort                                      :which-key "Org set effort")
      "oCg" '(org-clock-goto                                      :which-key "Go ot the last clock active")
      "oCi" '(org-clock-in                                        :which-key "Clock in in the current task")
      "oCI" '(org-clock-in-last                                   :which-key "Clock-in the last task")
      "oCo" '(org-clock-out                                       :which-key "Clock-out current clock")
      "on"  '((lambda () (interactive) (lem/interactive-find-file org-directory))        :which-key "Notes")
      "op"  '(:ignore t                                           :which-key "Pomodoro")
      "ops" '(org-pomodoro                                        :whick-key "Start org pomodoro")
      "opt" '(set-pomodoro-timer                                  :which-key "Set pomodoro timer")
      "ot"  '(:ignore t                                           :which-key "Insert time stamp")
      "ots" '(org-time-stamp                                      :which-key "Insert active time stamp")
      "oti" '(org-time-stamp-inactive                             :which-key "Insert inactive stamp")
      "or"  '(:ignore t                       :which-key "Org roam")
      "orI" '(org-roam-node-insert-immediate  :which-key "Roam insert immediately")
      "orc" '(lem/org-roam-capture-task       :which-key "Roam capture tast")
      "orf" '(org-roam-node-find              :whick-key "Org roam node find")
      "org" '(org-roam-ui-open                :whick-key "Open org roam graph")
      "ori" '(org-roam-node-insert            :whick-key "Org roam node insert")
      "orl" '(org-roam-buffer-togle           :which-key "Org roam buffer togle")
      "ort" '(:ignore t                       :which-key "Org roam tag")
      "orta" '(org-roam-tag-add               :which-key "Org roam tag add")
      "ortr" '(org-roam-tag-remove            :which-key "Org roam tag remove")
      "ords" '(org-roam-db-sync               :which-key "Sync org roam db")
      "p"  '(:ignore t                  :which-key "Projectile")
      "pf" '(projectile-find-file       :which-key "Projectile find file")
      "ps" '(projectile-switch-project  :which-key "Projectile switch project")
      "pF" '(consult-ripgrep            :which-key "Rip grep")
      "pc" '(projectile-compile-project :which-key "Compile Project")
      "pd" '(projectile-dired           :which-key "Projectile dired")
      "s" '(:ignore t      :which-key "sync")
      "so" '(lem/sync-org  :which-key "Sync org files")
      "sc" '(lem/sync-conf :which-key "Sync config folder")
      "sb" '(org-roam-db-sync :whick-key "Reload org roam DB")
      "t"  '(:ignore t                   :which-key "toggles")
      "tw" '(whitespace-mode             :which-key "whitespace")
      "td" '(lem-write-switch-dictionary :which-key "Toggle between dictionaries")
      "tt" '(lem/toggle-transparency     :which-key "Toggle between transparency states")
      "tl" '(org-toggle-link-display     :which-key "Toggle org link display")
      "tL" '(display-line-numbers-mode   :which-key "Toggle display line numbers")
      "tf" '(auto-fill-mode              :which-key "Toggle autofill mode")
      "r" '(:ignore t :which-key "sudo edit")
      "rf" '(sudo-edit-find-file :which-key "Sudo find file")
      "rF" '(sudo=edit :which-key "sudo edit current file")
      "u" '(universal-argument :which-key "Universal argument")
      "v" '(:ignore t            :which-key "Vterminal")
      "vt" '(multi-vterm         :which-key "Open vterm in same window")
      "vT" '(vterm-other-window  :which-key "Open vterm in other window"))
    
    (use-package perspective
      :custom
      (persp-mode-prefix-key (kbd "C-x x"))
      :init (persp-mode)
      :config
      (setq persp-state-default-file (expand-file-name "sessions" user-emacs-directory)))
    ;; Use ibuffer with perspective
    
    (add-hook
     'ibuffer-hook (lambda ()
                     (persp-ibuffer-set-filter-groups)
                     (unless (eq ibuffer-sorting-mode 'alphabetic)
                       (ibuffer-do-sort-by-alphabetic))))
    
    ;; Automatically save perspective states to file when Emacs exits.
    (add-hook 'kill-emacs-hook #'persp-state-save)
    
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
      "When minibuffer is completing a file name delete up to parent
      folder, otherwise delete a word"
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
    
    (use-package projectile
      :init
      (setq projectile-auto-discover nil
            projectile-globally-ignored-files '(".DS_Store" "TAGS")
            projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
            projectile-kill-buffers-filter 'kill-only-files)
      :diminish projectile-mode
      :config (projectile-mode +1)
      :demand t)
    
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
    
    (use-package flycheck
      :straight t
      :defer t
      :diminish
      :init (global-flycheck-mode))
    
    (use-package origami
      :hook (prog-mode . origami-mode))
    
    (use-package subword
      :config (global-subword-mode 1))
    
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
            (haskell-mode . eglot-ensure))
      :commands (eglot eglot-ensure))
    
    (use-package consult-eglot
      :defer t)
    
    (use-package flycheck-eglot
      :hook (eglot-managment-mode .flycheck-eglot-mode))
    
    (use-package python-mode
      :init
      (setq python-indent-guess-indent-offset t
            python-indent-guess-indent-offset-verbose nil
            python-shell-interpreter "python3"))
    
    (use-package pyvenv
      :init (setenv "WORKON_HOME" "~/.pyenv/versions")
      :config
      (pyvenv-mode 1)
      (add-hook 'python-mode-local-vars-hook #'pyvenv-track-virtualenv)
      (add-to-list 'global-mode-string
                   '(pyvenv-virtual-env-name (" venv:" pyvenv-virtual-env-name " "))
                   'append))
    
    (use-package lsp-pyright :ensure t)
    
    (defun lem/js-indentation ()
      "setup the default indent for javascript files."
      (setq js-chain-indent t
            ;; These have become standard in the JS community
            js-indent-level lem/js-indentation-value
            js2-basic-offset js-indent-level
            typescript-indent-level js-indent-level
            evil-shift-width js-indent-level
            tab-width js-indent-level))
    
    (defcustom lem/js-indentation-value 2
      "The default value for indent javascript and typescript files."
      :set (lambda (k v) (set-default k v) (lem/js-indentation))
      :group 'lem
      :type 'number)
    
    (use-package js2-mode
      :mode "\\.jsx?\\'"
      :ensure flycheck
      :hook ((js2-mode . js2-imenu-extras-mode)
             (js2-mode . prettier-js-mode)
             (js2-mode . lem/js-indentation))
      :config
      (setq 
       ;; let flycheck handle this
       js2-mode-show-parse-errors nil
       js2-mode-show-strict-warnings nil
       ;; Flycheck provides these features, so disable them: conflicting with
       ;; the eslint settings.
       js2-strict-missing-semi-warning nil)
       ;; Use js2-mode for Node scripts
       (add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode)))
    
    (use-package prettier-js
      :custom (prettier-js-args '("--print-width" "100"
                                  "--single-quote" "true"
                                  "--trailing-comma" "all"))
      :config
      (setq prettier-js-show-errors nil))
    
    (use-package js2-refactor
      :hook ((js2-mode rjsx-mode) . js2-refactor-mode))
    
    (use-package typescript-mode
      :ensure flycheck
      :hook ((typescript-mode . prettier-js-mode))
      :mode ("\\.\\(ts\\|tsx\\)\\'")
      :custom
      ;; TSLint is depreciated in favor of ESLint.
      (flycheck-disable-checker 'typescript-tslint)
      (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
      (typescript-indent-level lem/js-indentation-value)
      :config
      (flycheck-add-mode 'javascript-eslint 'typescript-mode))
    
    (use-package rjsx-mode)
    
    (defun lem/web-indentation ()
      "Setup the indentation for the web mode."
      (setq web-mode-markup-indent-offset lem/web-indentation-value ;; for html
            web-mode-css-indent-offset    lem/web-indentation-value ;; for css
            web-mode-code-indent-offset   lem/js-indentation-value  ;; for script/code
            web-mode-enable-auto-pairing  t
            web-mode-style-padding        lem/web-indentation-value
            web-mode-script-padding       lem/js-indentation-value))
    
    (defcustom lem/web-indentation-value 2
      "Default value of indentation for web mode.
    Default value is 2 following the standards."
      :set (lambda (k v) (set-default k v) (lem/web-indentation))
      :group 'lem
      :type 'number)
    
    (use-package web-mode
      :mode "(\\.html?"
      :config
      (lem/web-indentation))
    
    (use-package simple-httpd :defer t)
    (use-package impatient-mode :defer t)
    (use-package skewer-mode :defer t)
    
    (use-package rainbow-mode
      :hook ((css-mode sass-mode) . rainbow-mode))
    (use-package sass-mode)
    
    (add-hook 'emacs-lisp-mode-hook  #'(lambda () (setq evil-shift-width 2)))
    
    (use-package clojure-mode)
    (use-package cider
      :after clojure-mode)
    (use-package inf-clojure
      :after cider)
    
    (use-package haskell-mode
      :config
      (setq haskell-process-suggest-remove-import-lines t
            haskell-process-auto-import-loaded-modules t
            haskell-process-show-overlays nil
            haskell-process-type 'cabal-repl
    ))
    
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
    
    (use-package visual-fill-column)
    
    (use-package auctex)
    (use-package cdlatex)
    
    (defgroup lem-write ()
      "Lem group contains the default vars and function used in this module."
      :group 'lem
      :prefix "lem-write-")
    
    (defcustom lem-write-dictionaries-list '("en_US" "es_ES")
      "List of dictionaries used for spell checking."
      :type 'list
      :group 'lem-write)
    
    (defcustom lem-write-langtool-p t
      "Whether langtool should be used or not."
      :type 'bool
      :group 'lem-write)
    
    (defcustom lem-write-langtool-path "~/.local/lib/languageTool/LanguageTool-6.3/languagetool-commandline.jar"
      "Path where the langtool jar is stored."
      :type 'string
      :group 'lem-write
      :set (lambda (k v)
             (set-default k v)
             (when (fboundp 'langtool-language-tool-jar) (setq langtool-language-tool-jar v))))
    
    (defvar lem-write-dictionaries-pos 0)
    
    (defmacro inc (var)
      "Macro to increment VAR using modular arithmetic."
      `(setq ,var (mod (+ 1 ,var) (length lem-write-dictionaries-list))))
    
    (defun lem-write-switch-dictionary ()
      "Function to iterate over `lem-write-dictionaries-list'."
      (interactive)
      (let* ((dic ispell-current-dictionary)
             (change (nth (inc lem-write-dictionaries-pos) lem-write-dictionaries-list)))
        (ispell-change-dictionary change)
        (message "Dictionary switched from %s to %s" dic change)))
    
    (defun lem-write-text-mode-setup ()
      (interactive)
      (setq evil-auto-indent nil)
      (variable-pitch-mode 1)
      (auto-fill-mode 1))
    
    (add-hook 'text-mode-hook 'lem-write-text-mode-setup)
    
    (use-package flyspell
      :config
      (when
          (file-exists-p "/usr/bin/hunspell")
        (setq ispell-program-name "hunspell"))
      (setq ispell-current-dictionary (nth lem-write-dictionaries-pos lem-write-dictionaries-list))
      :hook (text-mode . flyspell-mode)
      :bind (("M-<f7>" . flyspell-buffer)
             ("<f7>"   . flyspell-word)
             ("C-;"    . flyspell-auto-correct-previous-word))
      ("C-c n d" . lem-write-switch-dictionary))
    
    (when lem-write-langtool-p
      (use-package langtool
      :config
      (setq langtool-language-tool-jar lem-write-langtool-path
            langtool-default-language (nth lem-write-dictionaries-pos lem-write-dictionaries-list))))
    
    (use-package markdown-mode
      :straight t
      :mode ("\\.mdx?\\'" . gfm-mode)
      :config
      (setq markdown-command "marked"))
    
    (defun markdown-html (buffer)
      (princ (with-current-buffer buffer
               (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>"
                       (buffer-substring-no-properties (point-min) (point-max))))
             (current-buffer)))
    
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
    
    (with-eval-after-load 'ox-latex
      (setq org-cite-biblatex-options 
            "backend=biber, style=ieee, isbn=false,sortcites, maxbibnames=5, minbibnames=1"
            ;; delete unwanted file extensions after latexMK
            org-latex-logfiles-extensions
            (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "xmpi" "run.xml" "bcf" "acn" "acr" "alg" "glg" "gls" "ist")))
    
    
      (add-to-list 'org-latex-classes '("org-plain-latex"
                                        "\\documentclass[11pt]{article}
    [NO-DEFAULT-PACKAGES]
    [NO-PACKAGES]
    \\renewcommand{\\baselinestretch}{1.15}
    \\parskip=6pt
    \\renewcommand{\\familydefault}{\\sfdefault}"
                                        ("\\section{%s}" . "\\section*{%s}")
                                        ("\\subsection{%s}" . "\\subsection*{%s}")
                                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
      (add-to-list 'org-latex-classes '("altacv" "\\documentclass[10pt,a4paper,ragged2e,withhyper]{altacv}
    % Change the page layout if you need to
    \\geometry{left=1.25cm,right=1.25cm,top=1.5cm,bottom=1.5cm,columnsep=1.2cm}
    
    % Use roboto and lato for fonts
    \\renewcommand{\\familydefault}{\\sfdefault}
    
    % Change the colours if you want to
    \\definecolor{SlateGrey}{HTML}{2E2E2E}
    \\definecolor{LightGrey}{HTML}{666666}
    \\definecolor{DarkPastelRed}{HTML}{450808}
    \\definecolor{PastelRed}{HTML}{8F0D0D}
    \\definecolor{GoldenEarth}{HTML}{E7D192}
    \\colorlet{name}{black}
    \\colorlet{tagline}{PastelRed}
    \\colorlet{heading}{DarkPastelRed}
    \\colorlet{headingrule}{GoldenEarth}
    \\colorlet{subheading}{PastelRed}
    \\colorlet{accent}{PastelRed}
    \\colorlet{emphasis}{SlateGrey}
    \\colorlet{body}{LightGrey}
    
    % Change some fonts, if necessary
    \\renewcommand{\\namefont}{\\Huge\\rmfamily\\bfseries}
    \\renewcommand{\\personalinfofont}{\\footnotesize}
    \\renewcommand{\\cvsectionfont}{\\LARGE\\rmfamily\\bfseries}
    \\renewcommand{\\cvsubsectionfont}{\\large\\bfseries}
    
    % Change the bullets for itemize and rating marker
    % for \cvskill if you want to
    \\renewcommand{\\itemmarker}{{\\small\\textbullet}}
    \\renewcommand{\\ratingmarker}{\\faCircle}
    "
    
                                        ("\\cvsection{%s}" . "\\cvsection*{%s}")))
    
    (add-to-list 'org-latex-classes '("moderncv"
    "\\documentclass{moderncv}
    \\usepackage[spanish]{babel}
    \\moderncvstyle{classic}
    \\moderncvcolor{green}
    \\renewcommand{\\familydefault}{\\sfdefault}
    \\usepackage[utf8]{inputenc}
    
    % Social icons
    \\social[linkedin]{lucas-elvira-martin}
    \\social[github]{luelvira}
    "))
    
      (defun my-latex-filter-removeOrgAutoLabels (text backend info)
        "Org-mode automatically generates labels for headings despite explicit use of `#+LABEL`. This filter forcibly removes all automatically generated org-labels in headings."
        (when (org-export-derived-backend-p backend 'latex)
          (replace-regexp-in-string "\\\\label{sec:org[a-f0-9]+}\n" "" text)))
    
      (add-to-list 'org-export-filter-headline-functions
                   'my-latex-filter-removeOrgAutoLabels))
    
    (use-package toc-org
      :commands toc-org-enable
      :hook (org-mode . toc-org-enable))
    
    (defconst lem/org-directory
      (concat (cond (is-debian "~/Sync/")
                    (is-fedora "~/Documents/")
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
            )
    
    (setq 
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
     '((emacs-lisp . t)
       (python . t)
       (js . t)
       (shell . t)
       (eshell . t)
       (gnuplot . t)))
    
    (push '("conf-unix" . conf-unix) org-src-lang-modes)
    (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
    
    ;; This is needed as of Org 9.2
    (require 'org-tempo)
    
    (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
    (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
    (add-to-list 'org-structure-template-alist '("py" . "src python"))
    (add-to-list 'org-structure-template-alist '("js" . "src js"))
    (add-to-list 'org-structure-template-alist '("ex" . "export"))
    (add-to-list 'org-structure-template-alist '("html" . "src html"))
    
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
                     "| %U | %^{fondo1} | %^{fondo2} |")
                    ("j" "Journals")
                    ("jj" "Journal entry" entry
                     (file+olp+datetree
                      ,(expand-file-name "Journal.org" org-directory) "Notes")
                     "\n* %<%H:%m>\n%?" :empty-lines 1)
                    ("jl" "Journal with link" entry
                     (file+olp+datetree
                      ,(expand-file-name "Journal.org" org-directory) "Notes")
                     "\n* %<%H:%m>\nFrom: %a\n%?" :empty-lines 1)
                    )))
    
    )
    
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
                                      ("mp" "Prepare meeting" entry "** Notes\n %?"
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
          citar-org-roam-capture-template-key "r")
    
    )
    
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
         nil "~/Documents/Org/roam/glossary.tex" 'append)))
    
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


## Define constants

This part aims to setting some special configuration based on the system Emacs is running

    ;; MachineInfo
    (defconst is-termux
      (string-suffix-p "Android" (string-trim (shell-command-to-string "uname -a")))
      "Boolean variable to determinate if Emacs is runing into termux system.")
    
    (defconst is-ubuntu
      (string= (system-name) "HP-Z1-G8")
      "Boolean variable to determinate if Emacs is runing on work's ubutnu machine.")
    
    (defconst is-debian
      (string= (system-name) "debian")
      "Boolean variable to determinate if Emacs is runing on home's debian machine.")
    
    (defconst is-fedora
      (string= (system-name) "fedora-laptop")
      "Boolean variable to determinate if Emacs is runing on laptop's fedora machine.")
    
    (defvar user-name nil
      "The name to be used in message.")
    ;; -MachineInfo

Get the user information

    ;; UserInfo
    (setq
      user-mail-address (string-trim (shell-command-to-string "git config --global user.email"))
      user-full-name (string-trim (shell-command-to-string "git config --global user.name"))
      user-name (getenv "USER"))
    ;; userInfo

Another constants

    ;; Consts
    (defconst lem/dotfiles "~/Documents/git/dotfiles/"
      "The path where the dotfiles git repo is stored.")
    
    (defconst python-p
      (or (executable-find "python3")
          (and (executable-find "python")
               (> (length (shell-command-to-string "python --version | grep 'Python 3'")) 0)))
      "Do we have python3?")
    
    (defconst pip-p
      (or (executable-find "pip3")
          (and (executable-find "pip")
               (> (length (shell-command-to-string "pip --version | grep 'python 3'")) 0)))
      "Do we have pip3?")
    ;; -Consts


# Package managment

For package management I combine `use-package` with `straight`. To boot the process, I will disable the checking step that ensure the system has the newest version of each package.

    ;;; init-package.el --- boostrap straight            -*- lexical-binding: t; -*-
    
    ;; Copyright (C) 2024  Lucas Elvira Martin
    
    ;; Author: Lucas Elvira Martin <lucas@debian>
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
    
    (if (eq system-type 'gnu/linux)
        ;; Straight
        (progn
          (setq straight-check-for-modifications nil)
          (defvar bootstrap-version)
          (let ((bootstrap-file
                 (expand-file-name
                  "straight/repos/straight.el/bootstrap.el"
                  (or (bound-and-true-p straight-base-dir)
                      user-emacs-directory)))
                (bootstrap-version 7))
            (unless (file-exists-p bootstrap-file)
              (with-current-buffer
                  (url-retrieve-synchronously
                   "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
                   'silent 'inhibit-cookies)
                (goto-char (point-max))
                (eval-print-last-sexp)))
            (load bootstrap-file nil 'nomessage))
    
          ;; Use straight by default
          (straight-use-package 'use-package)
          (setq straight-use-package-by-default t))
      ;; -Straight
    
      ;; DefaultPakcageManagement
        (setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
              package-archives
              '(("gnu" . "https://elpa.gnu.org/packages/")
                ("melpa" . "https://melpa.org/packages/")))
      ;; -DefaultPakcageManagement
    )
    
    
    (provide 'init-package)
    ;;; init-package.el ends here

In systems different to Linux, I don't use straight, I prefer to use the default
one system.

    ;;; init-package.el --- boostrap straight            -*- lexical-binding: t; -*-
    
    ;; Copyright (C) 2024  Lucas Elvira Martin
    
    ;; Author: Lucas Elvira Martin <lucas@debian>
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
    
    (if (eq system-type 'gnu/linux)
        ;; Straight
        (progn
          (setq straight-check-for-modifications nil)
          (defvar bootstrap-version)
          (let ((bootstrap-file
                 (expand-file-name
                  "straight/repos/straight.el/bootstrap.el"
                  (or (bound-and-true-p straight-base-dir)
                      user-emacs-directory)))
                (bootstrap-version 7))
            (unless (file-exists-p bootstrap-file)
              (with-current-buffer
                  (url-retrieve-synchronously
                   "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
                   'silent 'inhibit-cookies)
                (goto-char (point-max))
                (eval-print-last-sexp)))
            (load bootstrap-file nil 'nomessage))
    
          ;; Use straight by default
          (straight-use-package 'use-package)
          (setq straight-use-package-by-default t))
      ;; -Straight
    
      ;; DefaultPakcageManagement
        (setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
              package-archives
              '(("gnu" . "https://elpa.gnu.org/packages/")
                ("melpa" . "https://melpa.org/packages/")))
      ;; -DefaultPakcageManagement
    )
    
    
    (provide 'init-package)
    ;;; init-package.el ends here


# Global configugarion


## Keep it clean

First I define the default emacs back-up where all the cache files will be stored. I set the emacs directory in early-init to prevent emacs install staffs inside the config folder. Use no-littering to automatically set common paths to the new user-emacs-directory. Then define where will be store the temporal files.

    ;; ResetVars
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
    ;; -ResetVars


### Custom File

Also I will change the location of the custom-file.el, setting it in the config folder
\#INCLUDE: "modules/general-config.el" src emacs-lisp :lines "60-64"


## No littering

No littering is a package that aims to help you manage the backup files

    ;; NoLittering
    (use-package no-littering
      :demand t
      :config
      (let ((backup-dir (no-littering-expand-var-file-name "backup/")))
        (make-directory backup-dir t)
        (setq backup-directory-alist
              `(("\\`/tmp/" . nil)
                ("\\`/dev/shm/" . nil)
                ("." . ,backup-dir)))))


## Bindings

Disable some default bindings

    ;; DefBindings
    ;; Unbind unneeded keys
    (global-set-key (kbd "C-z") nil)
    (global-set-key (kbd "M-z") nil)
    (global-set-key (kbd "M-m") nil)
    (global-set-key (kbd "C-x C-z") nil)
    (global-set-key (kbd "M-/") nil)
    ;; -DefBindings

