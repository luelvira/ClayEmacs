- [ClayEMACS](#orgcf0d0ec)
  - [About](#orgaa489cf)
  - [About this README](#org8476e02)
  - [Enable literature configuration](#org5ff5309)
- [Startup](#orgb9f079e)
  - [Lexical binding](#org154e23f)
- [Early init](#orge23ea28)
  - [Startup performance](#org0332070)
    - [Disable unnecessary interface](#orgad5a011)
- [Boostrap configuration](#orgbb7cb3f)
  - [Update load path](#orgc4e87a0)
  - [Load our modules](#orgc7ae504)
  - [Package system](#org4353945)
  - [Define constants](#org22f89b2)
    - [Get environment variables](#orgbae1af9)
    - [Get User info](#org6327abd)
    - [Runtime constants](#org7eaa16f)
- [Dashboard](#org91b26bd)
- [General configuration](#org62bcfff)
  - [Keep it clean](#org8b3e871)
    - [No littering](#orgc6e798d)
  - [Startup screen](#org7e3584c)
  - [Default encoding](#org1bfc764)
  - [Disable warnings when native compilation](#org9cfcbd2)
  - [Recovery](#orgcc4955f)
  - [History](#orgce3d4fd)
  - [Confirmation prompts](#org257e1a5)
  - [Defaults](#org15663c3)
  - [Set up tramp](#org242c893)
  - [Emacs as server](#org7326667)
  - [Auto revert buffers](#orgd3117f8)
  - [Maximize windows by default and setup transparency](#org64110da)
  - [Enable scape instead of C-g](#orgd221226)
  - [Bookmarks and buffers](#org4f9d14b)
    - [Set up keys](#orgac7247c)
  - [Custom functions](#org2ff3f5c)
    - [Configuration file](#orgd8bbe37)
  - [END OF CORE](#orge520b8d)
- [lem module](#org2cdfa5e)
  - [Define transparency](#orgecad03f)
  - [Sync files](#orgd96e05b)
  - [File operations](#org5f3dd6c)
  - [Define the key bindings](#org8d16d8b)
  - [Reload emacs](#orgecea8c3)
  - [Define the key bindings](#org6f40512)
- [Theming](#org6c9167e)
  - [Reduce distractions](#org148c4ab)
  - [Configure lines](#orgf5b9752)
  - [modeline](#org492148e)
    - [Doom modeline](#org5d790c3)
    - [mood line](#org20e0273)
  - [diminish](#orged72ae3)
  - [Minions](#org6eb8646)
  - [create frame hook](#org0d9a857)
  - [Fonts](#orgd7a080f)
    - [Functions to set up the fonts](#org770616a)
    - [Fonts definition](#org7e380e7)
    - [Ligatures](#orge4c1c23)
    - [Setup icons](#org6ea470f)
  - [Global theme](#orgdac3ca0)
  - [Highlights](#org949995c)
  - [Highlight Matching Braces](#orgd3f1312)
  - [END OF THEMING](#orge2628a7)
- [Keyboard binding](#org6d221a2)
  - [Setup evil mode](#org89ca5e0)
    - [Set the undo system](#org7bfc350)
    - [Set the major mode](#orgb83cb26)
    - [Install evil related packages](#orgb5bfd4e)
    - [evil-pro(g) mode](#orgb83fd1b)
    - [Anzu and vim anzu](#orgb763e2c)
  - [Which Key](#orga687dd4)
  - [Custom shortcut with general](#orgdab2b5b)
    - [Eval expressions](#orgbc153a2)
    - [Bindings for configuration files](#org8c3d1b2)
    - [Dired keybinding](#orgd115299)
    - [File management](#orgc70da7c)
    - [Org shortcuts](#org4c3c3b5)
    - [Org roam shortcut](#orga1c2c64)
    - [Projectile](#orgf9cc593)
    - [Sync scripts](#orgfdee6ae)
    - [Toggle options](#orgdf5c5e6)
    - [root privileges.](#org3293b1a)
    - [Rebind C-u](#org7023480)
    - [vterm commands](#orga29514a)
- [Work Spaces](#org3877365)
- [Completion system](#org6108ce1)
  - [Completion at point](#orge5f21e8)
  - [Vertico](#orgdf20328)
  - [Consult](#org07c9ceb)
    - [Consult hacks](#orgbf5133a)
    - [Consult-dir](#org01c9877)
  - [Marginalia](#orgb8658c6)
  - [Completion action with Embark](#org19530ef)
  - [Completion in Regions with Corfu](#orga4a4c83)
  - [Smex](#orgb5dc74e)
  - [Orderless](#org56734f7)
- [File Management](#org1101dd9)
  - [Dired](#org05b5297)
  - [Peep dired](#org621b1a3)
- [Development](#orgb5ebf13)
  - [Project management](#orgbed9418)
    - [Git](#org59d6e79)
  - [Linters](#org4471d5c)
  - [Compilation](#orge514dd9)
  - [Language server protocol](#org127996d)
    - [EGLOT](#org2dba0b0)
  - [Language support](#orga9dad4d)
    - [Imperative programming](#orgfae72aa)
    - [Functional programming](#org43ebf7a)
  - [Terminals](#orgd1319cc)
    - [vterm](#org363f5d9)
    - [eshell](#orgc125fd7)
  - [Snippets](#orgd2ebf02)
  - [Time tracking with WakaTime and ActivityWatch](#orga38124f)
- [Writing](#orga2d0b56)
  - [Install dependencies](#orge7c3c2a)
    - [Center text view](#org53ff8a5)
    - [Latex](#orgb953398)
  - [Functions](#orga04d5de)
  - [Flyspell](#org8f019af)
  - [Language tool](#org68bfd7e)
  - [Markdown](#orgf9f12cd)
  - [zen mode](#org2837163)
  - [Configure the latex export](#orgac0a8c4)
  - [End of Write module](#org8d2a01a)
- [Org mode](#org74e2a2d)
  - [Enable table of content](#org96f6399)
  - [Define all the variables](#orgecd4808)
  - [GTD](#orgc77f406)
    - [Multiple  keyword sets in one file](#orgc07e5e0)
    - [Workflow states](#org3afc65d)
    - [Tags](#orgb87f274)
    - [Agendas](#org427f72a)
    - [Control time per task](#org29e8aba)
    - [Capture template for task](#orgd50d4bb)
    - [Habit](#org29609ec)
    - [Define the agenda view](#org137c3d2)
  - [Configure Babel languages](#org57e95a6)
  - [Structure templates](#org23491ef)
  - [Fonts and bullets](#org341c650)
    - [Bullets with org-superstar](#orgb8223b2)
    - [Increase the size of various heading](#orgf193645)
    - [Setting monospace fonts for required text](#org7e39a0b)
  - [Org templates](#orgf4c42d1)
  - [Close org mode configuration](#orgb0e1ce1)
  - [Update Org Mode Include automatically](#orgc08a3a0)
  - [Pomodoro](#org96976da)
  - [Org-auto-tangle](#org0876121)
  - [Auto show markup symbols](#org3ff6774)
  - [org evil](#org079187b)
  - [Install org ref and gnuplot support](#orge7671fa)
  - [Search function](#org23c812a)
  - [org wild notifier](#org8eaa6fa)
  - [Org present](#orgb0b8a63)
  - [Org Journal](#org682fc7f)
  - [Org export to html](#org4316d4a)
  - [GFM Exporter](#org672c8b3)
- [Org roam](#org5cbfee0)
  - [Installation](#orgb571bfe)
  - [Configure org roam templates](#orgb84c30e)
    - [Configure org roam completion find function](#org89ed217)
    - [Configure org roam dailies capture templates](#org8bd6327)
    - [Close org roam package declaration](#orgdc20720)
    - [Some functions used for customize org-roam](#orgfa23ea9)
  - [Zettelkasten](#org1460871)
    - [1. Fleeting notes](#orge2d3bbd)
    - [2. Literature Notes](#org0169866)
    - [3. Permanent Notes](#org9c19280)
    - [4. Index Notes](#orgf56c428)
  - [Org-roam-ui](#org9de490f)
  - [Combining org roam with markdown syntax!](#org44326c8)
- [Denote](#org148d8b3)
- [End clayemacs](#org96bce4e)



<a id="orgcf0d0ec"></a>

# ClayEMACS


<a id="orgaa489cf"></a>

## About


<a id="org8476e02"></a>

## About this README


<a id="org5ff5309"></a>

## Enable literature configuration

Emacs allows to export src blocks to a `.el` file and load them. This is a great option if you would like to describe each part of the configuation and explain a bit of them. To make them, you need to create a `init.el` file with the following code.

**Note** When I move to straight there is a bug with org-mode than generate a conflict with this method. I need to tangle manually all the config to the `init.el` file and `early-init.el` file respectively.

```
(org-babel-load-file
(expand-file-name
"config.org"
  user-emacs-directory))
```


<a id="orgb9f079e"></a>

# Startup


<a id="org154e23f"></a>

## Lexical binding

Lexical binding is a mode that allows to use special features of the languages. It options tell the configuration that works as a program more than just a simple configuration

This will generate a header at the top of the tangled file to indicate it is generated and is not meant to be modified directly.

```emacs-lisp
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
```


<a id="orge23ea28"></a>

# Early init

```emacs-lisp
<<header>>
```

The *early-init* file is loaded before any process of emacs, either the package system. So I will configure the directories used by Emacs to prevent the default behavior which get dirty the configuration folder.

```emacs-lisp
;; SetupFolder
(defvar private-emacs-directory nil
  "The folder where the Emacs configuration is stored.")
(setq private-emacs-directory user-emacs-directory
      ;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
      user-emacs-directory (expand-file-name "~/.cache/emacs/")
      url-history-file (expand-file-name "url/history" user-emacs-directory))
;; -SetupFolder
```

Package initialize occurs automatically, before user-init-file is loaded, but after early-init file. We handle package initialization, so we must prevent Emacs from doing it early! I use straight as package manager, so I need to disable the default behavior before the `package.el` is loaded.

```emacs-lisp
;; DisablePackage
(setq package-enable-at-startup nil)
;; -DisablePackage
```


<a id="org0332070"></a>

## Startup performance

Make startup faster by reducing the frequency of garbage collection and then use a hook to measure Emacs startup time.

```emacs-lisp
;; DefferGC
(setq site-run-file nil                  ; No site-wide run-time initializations.
      inhibit-default-init t             ; No site-wide default library
      gc-cons-threshold (* 50 1024 1024) ; The default is 800 kilobytes. Measured in bytes.
      gc-cons-percentage 0.2
      native-comp-eln-load-path (list (expand-file-name "eln-cache" user-emacs-directory)))
;; -DefferGC
```

After change the default values, I need to restore them when Emacs is launched with the following code in the *init.el* file.

```emacs-lisp
;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1024 1024)
                  file-name-handler-alist file-name-handler-alist-original)
            (makunbound 'file-name-handler-alist-original)
            (message "*** Emacs loaded in %s seconds with %d garbage collections."
                     (emacs-init-time "%.2f") gcs-done)))
```

Also, we can prevent launch the hook associated with some files modification in startup and reenable it after all the process is completed. From [MatthewZMD](https://github.com/MatthewZMD/.emacs.d)

> Every file opened and loaded by Emacs will run through this list to check for a proper handler for the file, but during startup, it won’t need any of them.

```emacs-lisp
;; FilenameHandler
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
;; -FilenameHandler
```


<a id="orgad5a011"></a>

### Disable unnecessary interface

```emacs-lisp
;; DefaultUI
(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
;; -DefaultUI
```

```emacs-lisp
(provide 'early-init)
;;; early-init.el ends here
```


<a id="orgbb7cb3f"></a>

# Boostrap configuration

The init file is the entry point. This file should have the base setting and import the rest of the modules.

```emacs-lisp
<<header>>

<<require>>
```


<a id="orgc4e87a0"></a>

## Update load path

Add the lisp script to the path

```emacs-lisp
(defun update-to-load-path (folder)
  "Update FOLDER and its subdirectories to `load-path'."
  (let ((base folder))
    (unless (member base load-path)
      (add-to-list 'load-path base))
    (dolist (f (directory-files base))
      (let ((name (concat base "/" f)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (unless (member base load-path)
            (add-to-list 'load-path name)))))))

(update-to-load-path (expand-file-name "modules" private-emacs-directory))
```


<a id="orgc7ae504"></a>

## Load our modules

After add the custom path, it is necessary to load the correspondent modules

```emacs-lisp
(require 'init-package)
(require 'init-consts)
```


<a id="org4353945"></a>

## Package system

For package management I combine `use-package` with [straight](https://github.com/radian-software/straight.el). To boot the process, I will disable the checking step that ensure the system has the newest version of each package.

```emacs-lisp
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
(setq straight-use-package-by-default t
      use-package-always-ensure nil)
```

In systems different to Linux, I don't use straight, I prefer to use the default one system.

```emacs-lisp
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
      package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
```

When Emacs uses the default package manager, it is needed to install `use-package`

```emacs-lisp
;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t)
  (setq use-package-compute-statistics t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package)
  (require 'bind-key))
```

Gutter all and export the package

```emacs-lisp
(if (eq system-type 'gnu/linux)
    (progn
      <<straight>>
      )
  (progn
    <<DefaultPackageManagement>>
    <<UsePackage>>
    )
)
(provide 'init-package)
;;; init-package.el ends here
```

```emacs-lisp
(require 'init-package)
```


<a id="org22f89b2"></a>

## Define constants

```emacs-lisp
<<header>>
```


<a id="orgbae1af9"></a>

### Get environment variables

This part aims to setting some special configuration based on the system Emacs is running

```emacs-lisp
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
;; -MachineInfo
```


<a id="org6327abd"></a>

### Get User info

**Note** I use the git configuration to get this values, but you are free to customize them.

```emacs-lisp
;; UserInfo
(defvar user-name nil
  "The name to be used in message.")

(setq
  user-mail-address (string-trim (shell-command-to-string "git config --global user.email"))
  user-full-name (string-trim (shell-command-to-string "git config --global user.name"))
  user-name (getenv "USER"))
;; -UserInfo
```


<a id="org7eaa16f"></a>

### Runtime constants

```emacs-lisp
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
;; Consts
```

```emacs-lisp
(provide 'init-consts)
;;; init-consts.el ends here
```

```emacs-lisp
(require 'init-consts)
```


<a id="org91b26bd"></a>

# Dashboard

Emacs Dashboard is an extensible startup screen showing you recent files, bookmarks, agenda items and an Emacs banner.

```emacs-lisp
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
```


<a id="org62bcfff"></a>

# General configuration


<a id="org8b3e871"></a>

## Keep it clean

First I define the default emacs back-up where all the cache files will be stored. I set the emacs directory in early-init to prevent emacs install staffs inside the config folder. Use no-littering to automatically set common paths to the new user-emacs-directory. Then define where will be store the temporal files

```emacs-lisp
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
```

Also I will change the location of the `custom-file.el`, setting it in the config folder

```emacs-lisp
(setq custom-file (expand-file-name "custom.el" private-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror 'nomessage))
```


<a id="orgc6e798d"></a>

### No littering

```emacs-lisp
(use-package no-littering
  :demand t
  :config
  (let ((backup-dir (no-littering-expand-var-file-name "backup/")))
    (make-directory backup-dir t)
    (setq backup-directory-alist
          `(("\\`/tmp/" . nil)
            ("\\`/dev/shm/" . nil)
            ("." . ,backup-dir)))))
```


<a id="org7e3584c"></a>

## Startup screen

```emacs-lisp
(setq-default inhibit-startup-screen  t
              inhibit-startup-message t
              inhibit-startup-echo-area-message user-full-name)
```


<a id="org1bfc764"></a>

## Default encoding

```emacs-lisp
;; Set encding by default
(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
(prefer-coding-system       'utf-8)     ; Add utf-8 at the front for automatic detection.
(set-terminal-coding-system 'utf-8)     ; Set coding system of terminal output
(set-keyboard-coding-system 'utf-8)     ; Set coding system for keyboard input on TERMINAL
(set-language-environment "English")    ; Set up multilingual environment
```


<a id="org9cfcbd2"></a>

## Disable warnings when native compilation

```emacs-lisp
(setq native-comp-async-report-warnings-errors nil)
;; Set the right directory to store the native comp cache
(add-to-list
  'native-comp-eln-load-path
  (expand-file-name "eln-cache/" user-emacs-directory))
```


<a id="orgcc4955f"></a>

## Recovery

If Emacs or the computer crashes, you can recover the files you were editing at the time of the crash from their auto-save files. To do this, start Emacs again and type the command M-x recover-session. Here, we parameterize how files are saved in the background.

```emacs-lisp
(setq auto-save-list-file-prefix ; Prefix for generating auto-save-list-file-name
      (expand-file-name ".auto-save-list/.saves-" user-emacs-directory)
      auto-save-default t        ; Auto-save every buffer that visits a file
      auto-save-timeout 20       ; Number of seconds between auto-save
      auto-save-interval 200)    ; Number of keystrokes between auto-saves

```


<a id="orgce3d4fd"></a>

## History

Remove text properties for kill ring entries (see <https://emacs.stackexchange.com/questions/4187>). This saves a lot of time when loading it.

```emacs-lisp
(defun unpropertize-kill-ring ()
  (setq kill-ring (mapcar 'substring-no-properties kill-ring)))
(add-hook 'kill-emacs-hook 'unpropertize-kill-ring)
```

Save every possible history

```emacs-lisp
(require 'savehist)
```

```emacs-lisp
(setq history-length 25
      history-delete-duplicates t)
(savehist-mode 1)
;; Remember and restore the last cursor location of opened files
(save-place-mode 1)
```

No duplicates in history

```emacs-lisp
(let (message-log-max)
  (savehist-mode))
```


<a id="org257e1a5"></a>

## Confirmation prompts

```emacs-lisp
(setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
              confirm-nonexistent-file-or-buffer nil  ; Ok to visit non existent files
              confirm-kill-emacs #'y-or-n-p)          ; Confirm before kill emacs
```


<a id="org15663c3"></a>

## Defaults

```emacs-lisp
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

```

Force split vertically

```emacs-lisp
(setq split-width-threshold 160
      split-height-threshold nil)
```

Resolve symlinks when opening files, so that any operations are conducted from the file's true directory (like \`find-file').

```emacs-lisp
(setq find-file-visit-truename t
      vc-follow-symlinks t)
```


<a id="org242c893"></a>

## Set up tramp

```emacs-lisp
(setq tramp-default-method "ssh")
```


<a id="org7326667"></a>

## Emacs as server

This command allow to run emacs as server, so all the startup can be done once time and connect client to it each time you need.

```emacs-lisp
(require 'server)
(unless (or is-termux
            (server-running-p))
  (server-start))
```


<a id="orgd3117f8"></a>

## Auto revert buffers

Autorevert enables reload from disk any buffer when it changes. This includes dired buffers

```emacs-lisp
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)
```


<a id="org64110da"></a>

## Maximize windows by default and setup transparency

In order of maximize the frame and change the transparency I use the `set-frame-parameter` expression and the `add-to-list 'default-frame-alist`. The function have been moved to the lisp library

```emacs-lisp
(unless is-termux
  (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))
```


<a id="orgd221226"></a>

## Enable scape instead of C-g

```emacs-lisp
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; By default, Emacs requires you to hit ESC trhee times to escape quit the minibuffer
(global-set-key [escape] 'keyboard-escape-quit)
```


<a id="org4f9d14b"></a>

## Bookmarks and buffers

```emacs-lisp
(setq bookmark-default-file
      (expand-file-name "bookmarks" user-emacs-directory))
```


<a id="orgac7247c"></a>

### Set up keys     :KEYS:

Use 'SPC b' for keybinings related to bookmarks and buffers

| COMMAND         | DESCRIPTION                            | KEYBINDING |
|--------------- |-------------------------------------- |---------- |
| list-bookmarks  | List bookmarks                         | SPC b L    |
| bookmark-set    | Set bookmark                           | SPC b m    |
| bookmark-delete | Delete bookmark                        | SPC b M    |
| bookmark-save   | Save current bookmark to bookmark file | SPC b w    |

```emacs-lisp
"b" '(:ignore t        :which-key "buffers/bookmarks")
"bl" '(bookmark-jump   :which-key "List bookmarks")
"bm" '(bookmark-set    :which-key "Set bookmark")
"bd" '(bookmark-delete :which-key "Delete bookmark")
"bw" '(bookmark-save   :which-key "Save current bookmark to bookmark file")
"br" '(revert-buffer   :whick-key "Revert buffer")
```

Regarding *buffers*, the text you are editing in Emacs resides in an object called a *buffer*. Each time you visit a file, a buffer is used to hold the file’s text. Each time you invoke Dired, a buffer is used to hold the directory listing. *Ibuffer* is a program that lists all of your Emacs *buffers*, allowing you to navigate between them and filter them.

| COMMAND          | DESCRIPTION          | KEYBINDING |
|---------------- |-------------------- |---------- |
| switch-to-buffer | change Buffer        | SPC b i    |
| kill-buffer      | Kill current buffer  | SPC b k    |
| next-buffer      | Goto next buffer     | SPC b n    |
| previous-buffer  | Goto previous buffer | SPC b p    |
| save-buffer      | Save current buffer  | SPC b s    |

```emacs-lisp
"bi" '(switch-to-buffer     :which-key "Switch buffer")
"bk" '(kill-current-buffer  :whick-key "Kill current buffer")
"bn" '(next-buffer          :whick-key "Goto next buffer")
"bp" '(previous-buffer      :whick-key "Goto previous-buffer buffer")
"bs" '(save-buffer          :whick-key "Save current buffer")
```


<a id="org2ff3f5c"></a>

## Custom functions


<a id="orgd8bbe37"></a>

### Configuration file

We can set a shortcut to open the config file from the emacs directory

```emacs-lisp
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
```


<a id="orge520b8d"></a>

## END OF CORE     :END:

```emacs-lisp
(provide 'lem-core)
;;; lem-core.el ends here
```

```emacs-lisp
(require 'lem-core)
```


<a id="org2cdfa5e"></a>

# lem module

This module contains some custom functions

```emacs-lisp
(defgroup lem ()
  "Group for some personal variables."
  :prefix  'lem
  :version '0.0.1)
```


<a id="orgecad03f"></a>

## Define transparency

```emacs-lisp
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
```


<a id="orgd96e05b"></a>

## Sync files

I have a script which try to keep sync with a repository on codeberg. This repo contains the org files only, and it is named sync.

```emacs-lisp
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
```


<a id="org5f3dd6c"></a>

## File operations

```emacs-lisp
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
```


<a id="org8d16d8b"></a>

## Define the key bindings     :KEYS:

```emacs-lisp
"fD" '(lem/delete-this-file :which-key "Delete current file")
"fR" '(lem/rename-this-file :which-key "Rename current file")
```


<a id="orgecea8c3"></a>

## Reload emacs

```emacs-lisp
(defun lem/reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))
```


<a id="org6f40512"></a>

## Define the key bindings     :KEYS:

```emacs-lisp
"ER" '(lem/reload-init-file :which-key "Reload init file")
```


<a id="org6c9167e"></a>

# Theming

```emacs-lisp
<<header>>
```


<a id="org148c4ab"></a>

## Reduce distractions

```emacs-lisp
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
```


<a id="orgf5b9752"></a>

## Configure lines

Set `display-line-numbers-width` to 3 make easy to prevent recalculate the width with some large files

```emacs-lisp
(setq-default dispaly-line-numbers-width 3
              display-line-numbers-widen t)
```

Enable line numbers for some modes

```emacs-lisp
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))
```


<a id="org492148e"></a>

## modeline

**NOTE:** The first time you load your configuration on a new machine, you'll need to run \`M-x all-the-icons-install-fonts\` so that mode line icons display correctly.

```emacs-lisp
(setq display-time-format "%H:%M %b %y"
      display-time-default-load-average nil)
(display-time-mode 1)
```


<a id="org5d790c3"></a>

### Doom modeline

[doom-modeline](https://github.com/seagle0128/doom-modeline) is a very attractive and rich (yet still minimal) mode line configuration for Emacs. The default configuration is quite good but you can check out the [configuration options](https://github.com/seagle0128/doom-modeline#customize) for more things you can enable or disable.

Above there is the config for the doom-modeline

```emacs-lisp
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
```


<a id="org20e0273"></a>

### mood line

[mood line](https://github.com/jessiehildebrandt/mood-line) as alternative to doom modeline

```emacs-lisp
(use-package mood-line
  :config
  (setq mood-line-glyph-alist mood-line-glyphs-fira-code)
  (mood-line-mode))
```


<a id="orged72ae3"></a>

## diminish

The diminish package hides pesky minor modes from the modeline

```emacs-lisp
(use-package diminish)
```


<a id="org6eb8646"></a>

## Minions

Minions is a package that implements a nested menu which gives access to all known minor modes

```emacs-lisp
(use-package minions
  :hook ((doom-modeline-mode mood-line-mode) . minions-mode))
```


<a id="org0d9a857"></a>

## create frame hook

Emacs in daemon mode has a problem loading the fonts. By default, the init file is not read until the first frame is loaded, so the changes on the ui should be done after it.

Emacs has some `hooks` like the `after-make-frame-functions`, which allows us to call a function after a frame is created. This function receive as argument the current frame

```emacs-lisp
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (lem/set-fonts frame)
                (lem/set-background frame)))
  (add-hook 'after-init-hook
            (lambda ()
              (lem/set--fonts)
              (lem/set-background))))
```


<a id="orgd7a080f"></a>

## Fonts


<a id="org770616a"></a>

### Functions to set up the fonts

```emacs-lisp
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
```


<a id="org7e380e7"></a>

### Fonts definition

Defining the various fonts that Emacs will use.

```emacs-lisp
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
```


<a id="orge4c1c23"></a>

### Ligatures

```emacs-lisp
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
```


<a id="org6ea470f"></a>

### Setup icons

This is an icon set that can be used with dashboard, dired, ibuffer and other Emacs programs.

```emacs-lisp
(use-package nerd-icons :defer t)
(use-package nerd-icons-dired
    :defer t
    :hook
    (dired-mode . nerd-icons-dired-mode))
(use-package nerd-icons-completion
    :defer t
    :config
    (nerd-icons-completion-mode))
```


<a id="orgdac3ca0"></a>

## Global theme

[doom-themes](https://github.com/hlissner/emacs-doom-themes) is a great set of themes with a lot of variety and support for many different Emacs modes.

```emacs-lisp
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (load-theme 'doom-dracula t))
```

```emacs-lisp
(use-package nord-theme
  :defer t
  :straight (nord-theme
             :type git
             :host github
             :local-repo "northeme"
             :repo "nordtheme/emacs"))

(use-package dracula-theme
  :defer t
  :straight (draculta-theme
             :type git
             :host github
             :repo "dracula/emacs"))
```

```emacs-lisp
(load-theme 'modus-vivendi t)
```


<a id="org949995c"></a>

## Highlights

```emacs-lisp
(require 'hl-line)
```

```emacs-lisp
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'conf-mode-hook #'hl-line-mode)
```

```emacs-lisp
(use-package rainbow-delimiters
  :init (setq rainbow-delimiters-max-face-count 4)
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))
```


<a id="orgd3f1312"></a>

## Highlight Matching Braces

```emacs-lisp
(use-package paren
  :config
  (setq show-paren-delay 0.1
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t)
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))
```


<a id="orge2628a7"></a>

## END OF THEMING     :END:

```emacs-lisp
(provide 'lem-theme)
```

```emacs-lisp
(require 'lem-theme)
```


<a id="org6d221a2"></a>

# Keyboard binding


<a id="org89ca5e0"></a>

## Setup evil mode

Evil mode is a mayor mode that allow to use vim keybindings in emacs

```emacs-lisp
(global-set-key (kbd "C-M-u") 'universal-argument)
```


<a id="org7bfc350"></a>

### Set the undo system

```emacs-lisp
(use-package undo-tree
:init (global-undo-tree-mode 1)
:config
(setq undo-tree-auto-save-history nil))
```


<a id="orgb83cb26"></a>

### Set the major mode

This configuration uses [evil-mode](https://evil.readthedocs.io/en/latest/index.html) for a Vi-like modal editing experience. [general.el](https://github.com/noctuid/general.el) is used for easy keybinding configuration that integrates well with which-key. [evil-collection](https://github.com/emacs-evil/evil-collection) is used to automatically configure various Emacs modes with Vi-like keybindings for evil-mode.

```emacs-lisp
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
```


<a id="orgb5bfd4e"></a>

### Install evil related packages

Evil collection is a package that provide evil keybindings for a lot of modes

```emacs-lisp
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
```


<a id="orgb83fd1b"></a>

### evil-pro(g) mode

I define a custom minor mode to enable/disable the navigation with the arrows. Depend's of the context I prefer using one set of keys or another

```emacs-lisp
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
```


<a id="orgb763e2c"></a>

### Anzu and vim anzu

[Anzu](https://github.com/victorteokw/emacs-anzu) is a port of [vim-anzu](https://github.com/osyo-manga/vim-anzu), which provides a minor mode to display *current match* and *total matches* in the modeline.

```emacs-lisp
(use-package anzu)

(use-package evil-anzu
  :after evil
  :config (global-anzu-mode +1))
```


<a id="orga687dd4"></a>

## Which Key

[which-key](https://github.com/justbur/emacs-which-key) is a useful UI panel that appears when you start pressing any key binding in Emacs to offer you all possible completions for the prefix. For example, if you press `C-c` (hold control and press the letter `c`), a panel will appear at the bottom of the frame displaying all of the bindings under that prefix and which command they run. This is very useful for learning the possible key bindings in the mode of your current buffer.

```emacs-lisp
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
```


<a id="orgdab2b5b"></a>

## Custom shortcut with general

General is a package that provides a more convenient method for binding keys in emacs

```emacs-lisp
(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer lem/leader-key-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(lem/leader-key-def
  <<keybinding>>)
```


<a id="orgbc153a2"></a>

### Eval expressions

| Command         | Description                                      | shortcut |
|--------------- |------------------------------------------------ |-------- |
| eval-buffer     | Evaluate the elisp code for the current buffer   | "eb"     |
| eval-defun      | Evaluate the current function definition         | "ed"     |
| eval-expression | Open an interactive input to execute a lisp code | "ee"     |
| eval-last-sexp  | Evaluate the last expression                     | "el"     |
| eval-region     | Evaluate the selected region                     | "er"     |

```emacs-lisp
"e" '(:ignore t        :which-key "Eshell/Evaluate")
"eb" '(eval-buffer     :which-key "Evaluate elisp in buffer")
"ed" '(eval-defun      :which-key "Evaluate defun containing or after point")
"ee" '(eval-expression :which-key "Evaluate and elisp expression")
"el" '(eval-last-sexp  :which-key "Evaluate elisp expression before point")
"er" '(eval-region     :which-key "Evaluate elisp in region")
```


<a id="org8c3d1b2"></a>

### Bindings for configuration files

```emacs-lisp
"fp" '(lem/go-dotfiles       :which-key "Config")
"fe" '(:ignore t             :which-key "Emacs files")
"fec" '(lem/go-emacs-config  :which-key "Emacs Config file")
"fei" '(lem/go-emacs-init    :which-key "Emacs init file")
"fem" '(lem/go-emacs-modules :which-key "Custom libraries")
```


<a id="orgd115299"></a>

### Dired keybinding

```emacs-lisp
"d"  '(:ignore t          :which-key "Dired")
"dd" '(dired              :which-key "Open dired")
"dj" '(dired-jump         :which-key "Dired jump to current")
"dp" '(lem/jump-dotfiles  :which-key "Go to dotfiles folder")
```


<a id="orgc70da7c"></a>

### File management

| Command              | Description          | shortcut |
|-------------------- |-------------------- |-------- |
| View recent files    | Display recent files | r        |
| lem/delete-this-file | Delete current file  | D        |
| lem/rename-this-file | Rename current file  | R        |
| find-file            | Find files in CW     | f        |

```emacs-lisp
"f" '(:ignore t             :which-key "Files")
"fD" '(lem/delete-this-file :which-key "Delete current file")
"fd" '(find-grep-dired      :whick-key "Search for string in files in DIR")
"ff" '(find-file            :which-key "Find files")
"fr" '(recentf-open-files   :which-key "Recent files")
"fR" '(lem/rename-this-file :which-key "Rename current file")
```


<a id="org4c3c3b5"></a>

### Org shortcuts

```emacs-lisp
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
```


<a id="orga1c2c64"></a>

### Org roam shortcut

```emacs-lisp
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
```


<a id="orgf9cc593"></a>

### Projectile

| COMMAND                    | DESCRIPTION                   | KEYBINDING |
|-------------------------- |----------------------------- |---------- |
| -                          | Projectile entries            | p          |
| projectile-find-file       | Find file inside project      | pf         |
| projectile-switch-project  | change to another project     | ps         |
| consult-ripgrep            | Search in the project with rg | pF         |
| projectile-compile-project | compile current project       | pc         |
| projectile-dired           | open dired in project root    | pd         |

```emacs-lisp
"p"  '(:ignore t                  :which-key "Projectile")
"pf" '(projectile-find-file       :which-key "Projectile find file")
"ps" '(projectile-switch-project  :which-key "Projectile switch project")
"pF" '(consult-ripgrep            :which-key "Rip grep")
"pc" '(projectile-compile-project :which-key "Compile Project")
"pd" '(projectile-dired           :which-key "Projectile dired")
```


<a id="orgfdee6ae"></a>

### Sync scripts

```emacs-lisp
"s" '(:ignore t      :which-key "sync")
"so" '(lem/sync-org  :which-key "Sync org files")
"sc" '(lem/sync-conf :which-key "Sync config folder")
"sb" '(org-roam-db-sync :whick-key "Reload org roam DB")
```


<a id="orgdf5c5e6"></a>

### Toggle options

```emacs-lisp
"t"  '(:ignore t                   :which-key "toggles")
"tw" '(whitespace-mode             :which-key "whitespace")
"td" '(lem-write-switch-dictionary :which-key "Toggle between dictionaries")
"tt" '(lem/toggle-transparency     :which-key "Toggle between transparency states")
"tl" '(org-toggle-link-display     :which-key "Toggle org link display")
"tL" '(display-line-numbers-mode   :which-key "Toggle display line numbers")
"tf" '(auto-fill-mode              :which-key "Toggle autofill mode")
```


<a id="org3293b1a"></a>

### root privileges.

```emacs-lisp
"r" '(:ignore t :which-key "sudo edit")
"rf" '(sudo-edit-find-file :which-key "Sudo find file")
"rF" '(sudo=edit :which-key "sudo edit current file")
```


<a id="org7023480"></a>

### Rebind C-u

Emacs by default use C-u for the universal-argument command, so if I want to keep the default behavior of vi, I need to rebind it.

```emacs-lisp
"u" '(universal-argument :which-key "Universal argument")
```


<a id="orga29514a"></a>

### vterm commands

```emacs-lisp
"v" '(:ignore t            :which-key "Vterminal")
"vt" '(multi-vterm         :which-key "Open vterm in same window")
"vT" '(vterm-other-window  :which-key "Open vterm in other window")
```


<a id="org3877365"></a>

# Work Spaces

```emacs-lisp
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
```


<a id="org6108ce1"></a>

# Completion system


<a id="orge5f21e8"></a>

## Completion at point

Cape is a completion at point extension.

```emacs-lisp
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
```

Overwrite the completion at point shortcut of evil-mode. The default system works better to your use.

```emacs-lisp
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
```


<a id="orgdf20328"></a>

## Vertico

[Vertico](https://github.com/minad/vertico) provides a performant and minimalistic vertical completion UI based on the default completion system but aims to be highly flexible, extensible and modular.

```emacs-lisp
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
```


<a id="org07c9ceb"></a>

## Consult

Consult provides a lot of useful completion commands similar to Ivy’s Counsel.

```emacs-lisp
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
```


<a id="orgbf5133a"></a>

### Consult hacks

For the [consult-goto-line](help:consult-goto-line) and `consult-line` commands, we define our owns with live preview (independently of the [consult-preview-key](help:consult-preview-key)) ([Example from rougier](https://github.com/rougier/dotemacs/blob/37a22e94b39bc0c2965c40b3ec331438f04d1efe/dotemacs.org?plain=1#L2007))

```emacs-lisp
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
```

The consult wiki has a demo for the find file function with preview

```emacs-lisp
(setq read-file-name-function #'consult-find-file-with-preview)

(defun consult-find-file-with-preview (prompt &optional dir default mustmatch initial pred)
  (interactive)
  (let ((default-directory (or dir default-directory))
        (minibuffer-completing-file-name t))
    (consult--read #'read-file-name-internal
                   :state (consult--file-preview)
                   :prompt prompt
                   :initial initial
                   :require-match mustmatch
                   :predicate pred)))
```


<a id="org01c9877"></a>

### Consult-dir

```emacs-lisp
(use-package consult-dir
  :straight t
  :bind (([remap list-directory] . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file))
  :custom
  (consult-dir-project-list-function nil))
```


<a id="orgb8658c6"></a>

## Marginalia

[Marginalia](https://github.com/minad/marginalia) add annotations at the margin of the minibuffer, like ivy-rich, but for [vertico](#orgdf20328)

```emacs-lisp
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
```


<a id="org19530ef"></a>

## Completion action with Embark

```emacs-lisp
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
```


<a id="orga4a4c83"></a>

## Completion in Regions with Corfu


<a id="orgb5dc74e"></a>

## Smex

Smex is a package that makes M-x remember out history

```emacs-lisp
(use-package smex
  :config
  (smex-initialize))
```


<a id="org56734f7"></a>

## Orderless

[Orderless](https://github.com/oantolin/orderless) improves candidate filtering create pattern by words separate with spaces and display any command which has the same words in any order

```emacs-lisp
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))
```


<a id="org1101dd9"></a>

# File Management


<a id="org05b5297"></a>

## Dired

```emacs-lisp
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
```

```emacs-lisp
(use-package dired-open
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("png" . "sxiv")
                                ("mkv" . "mpv")
                                ("pdf" . "firefox")
                                ("mp4" . "mpv"))))
```


<a id="org621b1a3"></a>

## Peep dired

```emacs-lisp
(use-package peep-dired
  :after t
  :hook (evil-normalize-keymaps . peep-dired-hook)
  :config
    (evil-define-key 'normal peep-dired-mode-map (kbd "C-j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "C-k") 'peep-dired-prev-file))
```


<a id="orgb5ebf13"></a>

# Development


<a id="orgbed9418"></a>

## Project management

```emacs-lisp
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
```


<a id="org59d6e79"></a>

### Git

1.  Magit

    ```emacs-lisp
    (if (version< emacs-version "29.0")
      (use-package seq))
    (use-package magit)
    ```

2.  Git gutter

    Git gutter is a software which make easy to view the difference between a file and the last commit from the same file.
    
    ```emacs-lisp
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
    ```
    
    [git-timemachine](https://github.com/emacsmirror/git-timemachine) is a program that allows you to move backwards and forwards through a file's commits. Use `SPC g t` to open time machine, and, in normal mode, `C-j` and `C-k` to move forward the changes on the current file
    
    ```emacs-lisp
    (use-package git-timemachine
    :hook (evil-normalize-keymaps . git-timemachine-hook)
    :config
        (evil-define-key 'normal git-timemachine-mode-map (kbd "C-j") 'git-timemachine-show-previous-revision)
        (evil-define-key 'normal git-timemachine-mode-map (kbd "C-k") 'git-timemachine-show-next-revision))
    ```

3.  Git commit

    [Git commit](https://github.com/magit/magit/blob/master/lisp/git-commit.el) forces you to follow the commits message conventions
    
    ```emacs-lisp
    (use-package git-commit
      :ensure nil
      :preface
      (defun my/git-commit-auto-fill-everywhere ()
        "Ensure that the commit body does not exceed 72 characters."
        (setq fill-column 72)
        (setq-local comment-auto-fill-only-comments nil))
      :hook (git-commit-mode . my/git-commit-auto-fill-everywhere)
      :custom (git-commit-summary-max-length 50))
    ```

4.  Ediff

    `ediff` is a diff program that is built into Emacs. By default, ‘ediff’ splits files vertically and places the ‘help’ frame in its own window. I have changed this so the two files are split horizontally and the `help` frame appears as a lower split within the existing window. Also, I create my own ‘dt-ediff-hook’ where I add `j/k` for moving to next/prev diffs. By default, this is set to `n/p`.
    
    ```emacs-lisp
    (setq ediff-split-window-function 'split-window-horizontally
          ediff-window-setup-function 'ediff-setup-windows-plain)
    
    (defun dt-ediff-hook ()
      (ediff-setup-keymap)
      (define-key ediff-mode-map "j" 'ediff-next-difference)
      (define-key ediff-mode-map "k" 'ediff-previous-difference))
    
    (add-hook 'ediff-mode-hook 'dt-ediff-hook)
    ```

5.  General keybinding for (ma)git

    | COMMAND                  | DESCRIPTION           | KEYBINDING |
    |------------------------ |--------------------- |---------- |
    | magit-status             | launch magit          | gs         |
    | magit-diff-unstaged      | git diff              | gd         |
    | magit-branch-or-checkout | git checkout          | gc         |
    | magit-log-current        | git log               | glc        |
    | magit-log-buffer-file    | git log current file  | glf        |
    | magit-branch             | git branch            | gb         |
    | magit-push-current       | git push              | gP         |
    | magit-pull-branch        | git pull              | gp         |
    | magit-fetch              | git fetch             | gf         |
    | magit-fetch-all          | git fetch &#x2013;all | gF         |
    | magit-rebase             | git rebase            | gr         |
    
    ```emacs-lisp
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
    ```


<a id="org4471d5c"></a>

## Linters

Install `luacheck` from your Linux distro's repositories for flycheck to work correctly with lua files. Install `python-pylint` for flycheck to work with python files. Haskell works with flycheck as long as `haskell-ghc` or `haskell-stack-ghc` is installed. For more information on language support for flycheck, [read this](https://www.flycheck.org/en/latest/languages.html).

```emacs-lisp
(use-package flycheck
  :straight t
  :defer t
  :diminish
  :init (global-flycheck-mode))
```

Origami is a module that allows you to fold the code

```emacs-lisp
(use-package origami
  :hook (prog-mode . origami-mode))
```

Subwords allows you to interact with camelCase words as separate words

```emacs-lisp
(use-package subword
  :config (global-subword-mode 1))
```


<a id="orge514dd9"></a>

## Compilation

```emacs-lisp
(use-package compile
  :straight nil
  :custom
  (compilation-scroll-output t))

(defun auto-recompile-buffer ()
  (interactive)
  (if (member #'recompile after-save-hook)
      (remove-hook 'after-save-hook #'recompile t)
    (add-hook 'after-save-hook #'recompile nil t)))
```


<a id="org127996d"></a>

## Language server protocol


<a id="org2dba0b0"></a>

### EGLOT

[eglot](https://github.com/joaotavora/eglot) is lsp client for emacs that in meacs 29 will (is) part of the core of emacs

```emacs-lisp
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
```


<a id="orga9dad4d"></a>

## Language support

I want to group each languages by its paradigm


<a id="orgfae72aa"></a>

### Imperative programming

1.  Python

    ```emacs-lisp
    (use-package python-mode
      :init
      (setq python-indent-guess-indent-offset t
            python-indent-guess-indent-offset-verbose nil
            python-shell-interpreter "python3"))
    ```
    
    Use pyvenv to manage and use `virtualenv`. Run `pyvenv-activate` to configure Emacs to cause `lsp-mode` to use virtual environment.
    
    ```emacs-lisp
    (use-package pyvenv
      :init (setenv "WORKON_HOME" "~/.pyenv/versions")
      :config
      (pyvenv-mode 1)
      (add-hook 'python-mode-local-vars-hook #'pyvenv-track-virtualenv)
      (add-to-list 'global-mode-string
                   '(pyvenv-virtual-env-name (" venv:" pyvenv-virtual-env-name " "))
                   'append))
    ```
    
    1.  lsp for python
    
        ```emacs-lisp
        (use-package lsp-pyright :ensure t)
        ```

2.  WEB

    1.  JavaScript/TypeScript
    
        There are a lot of package aimed to work with js/ts code. Some of theme are `js-mode`, `js2-mode`, `web-mode`&#x2026; For javascript files I will use js2-mode because this is the one used by other frameworks such doom emacs. And, for editing html and css related files, `web-mode`
        
        ```emacs-lisp
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
        
        ```
        
        For formatting the js code, I think the best tool is [prettier](https://prettier.io/).
        
        ```emacs-lisp
        (use-package prettier-js
          :custom (prettier-js-args '("--print-width" "100"
                                      "--single-quote" "true"
                                      "--trailing-comma" "all"))
          :config
          (setq prettier-js-show-errors nil))
        ```
        
        [js2-refactor](https://github.com/js-emacs/js2-refactor.el) provides a small list of refactoring functions for JavaScript in Emacs
        
        ```emacs-lisp
        (use-package js2-refactor
          :hook ((js2-mode rjsx-mode) . js2-refactor-mode))
        ```
        
        Sometimes I need to work with typescript&#x2026;
        
        ```emacs-lisp
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
        ```
        
        And with react
        
        ```emacs-lisp
        (use-package rjsx-mode)
        ```
    
    2.  HTML and CSS
    
        ```emacs-lisp
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
        ```
        
        Also we can enable [simple-http](https://github.com/skeeto/emacs-web-server/tree/master) to create a server in the current path and use [impatient mode](https://github.com/skeeto/impatient-mode/tree/master) like a live server.
        
        Also [skewer](https://github.com/skeeto/skewer-mode/tree/master) provides a live interaction with JavaScript, CSS, and HTML.
        
        These package don't work as I expect. They have a lot of problem rendering png image or loading external scripts.
        
        ```emacs-lisp
        (use-package simple-httpd :defer t)
        (use-package impatient-mode :defer t)
        (use-package skewer-mode :defer t)
        ```
        
        Another package that could be helpful
        
        ```emacs-lisp
        (use-package rainbow-mode
          :hook ((css-mode sass-mode) . rainbow-mode))
        (use-package sass-mode)
        ```


<a id="org43ebf7a"></a>

### Functional programming

1.  elisp mode

    This is a small configuration to make evil-shift-width to 2 in `emacs lisp mode`
    
    ```emacs-lisp
    (add-hook 'emacs-lisp-mode-hook  #'(lambda () (setq evil-shift-width 2)))
    ```

2.  Clojure

    ```emacs-lisp
    (use-package clojure-mode)
    (use-package cider
      :after clojure-mode)
    (use-package inf-clojure
      :after cider)
    ```

3.  Haskell

    ```emacs-lisp
    (use-package haskell-mode
      :config
      (setq haskell-process-suggest-remove-import-lines t
            haskell-process-auto-import-loaded-modules t
            haskell-process-show-overlays nil
            haskell-process-type 'cabal-repl
    ))
    ```

4.  PureScript

    ```emacs-lisp
    (use-package purescript-mode
      :config
      (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
      (add-hook 'purescript-mode-hook 'flycheck-mode))
    
    (use-package psc-ide
      :hook (purescript-mode . psc-ide-mode)
      :config
      (remove-hook 'company-backends 'company-psc-ide-backend)
      (psc-ide-flycheck-setup))
    ```


<a id="orgd1319cc"></a>

## Terminals


<a id="org363f5d9"></a>

### vterm

vterm enables the use of fully-fledged terminal applications within Emacs so that I don't need an external terminal emulator.

It need to be compiled, so you need to install first some dependencies

```shell
apt install make cmake libterm-bin libterm
```

```emacs-lisp
(use-package vterm
  :commands vterm
  :init (add-hook 'vterm-exit-functions
                  (lambda (_ _)
                    (let* ((buffer (current-buffer))
                           (window (get-buffer-window buffer)))
                      (when (not (one-window-p))
                        (delete-window window))
                      (kill-buffer buffer))))
  :preface
  (when noninteractive
    (advice-add #'vterm-module-compile :override #'ignore)
    (provide 'vterm-module))
  :config
  (setq vterm-max-scrollback 10000
        vterm-kill-buffer-on-exit t))

(add-to-list 'display-buffer-alist
             '("\*vterm"
               (display-buffer-in-side-window)
               (window-height . 0.25)
               (side . bottom)
               (slot . 0)))
```

```emacs-lisp
(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000
        vterm-kill-buffer-on-exit t))
```

```emacs-lisp
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

```

```emacs-lisp
(use-package multi-vterm :after vterm)
```


<a id="orgc125fd7"></a>

### eshell

```emacs-lisp
(use-package eshell
  :straight nil
  (define-key eshell-mode-map (kbd "<tab>") 'completion-at-point))

```


<a id="orgd2ebf02"></a>

## Snippets

Snippets are a short text which is enabled to be expanded. yasnippet provide the mechanism, but does not have the snippets. You need to lead them. I will try with yasnippet-snippets and doom-snippets. The first one use the < character at the begin of the text, while doom-snippets not.

```emacs-lisp
  (use-package yasnippet
    :defer t
    :config
    (delq 'yas-dropdown-prompt yas-prompt-functions)
    (yas-global-mode 1))

  (use-package yasnippet-snippets)

(use-package doom-snippets
  :after yasnippet
  :straight (doom-snippets :type git :host github :repo "doomemacs/snippets" :files ("*.el" "*")))
```


<a id="orga38124f"></a>

## Time tracking with WakaTime and ActivityWatch

Wakatime is an opensource software aims at provide you metrics about the time you spend codding in the different projects you have.

```emacs-lisp
(use-package wakatime-mode
  :straight t
  :config
  (global-wakatime-mode))
```

```emacs-lisp
(use-package activity-watch-mode
:disabled
:straight t
:config
(global-activity-watch-mode))
```


<a id="orga2d0b56"></a>

# Writing

```emacs-lisp
<<header>>
```


<a id="orge7c3c2a"></a>

## Install dependencies


<a id="org53ff8a5"></a>

### Center text view

```emacs-lisp
(use-package visual-fill-column)
```


<a id="orgb953398"></a>

### Latex

```emacs-lisp
(use-package auctex)
(use-package cdlatex)
```


<a id="orga04d5de"></a>

## Functions

We can configure multiples dictionaries and toggle between them

```emacs-lisp
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
```

Every time emacs enter in text-mode, call this function which set the fill-column to the customize-value, enable the `variable-pitch-mode` and active the autofill. Autofill is disable in `org-mode` because I use to have code snippets.

```emacs-lisp
(defun lem-write-text-mode-setup ()
  (interactive)
  (setq evil-auto-indent nil)
  (variable-pitch-mode 1)
  (auto-fill-mode 1))

(add-hook 'text-mode-hook 'lem-write-text-mode-setup)
```


<a id="org8f019af"></a>

## Flyspell

Flyspell is a mode that allows you to see typing errors. By default it is disable, but can be configure to be used on different kinds of situations.

```emacs-lisp
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
```


<a id="org68bfd7e"></a>

## Language tool

Language tool is a software that check both, grammar and spelling in different languages.

```bash
curl https://languagetool.org/download/LanguageTool-stable.zip -o /tmp/LanguageTool-stable.zip
mkdir -p ~/.local/lib/
unzip /tmp/LanguageTool-stable.zip -d ~/.local/lib/languageTool
```

```emacs-lisp
(when lem-write-langtool-p
  (use-package langtool
  :config
  (setq langtool-language-tool-jar lem-write-langtool-path
        langtool-default-language (nth lem-write-dictionaries-pos lem-write-dictionaries-list))))
```


<a id="orgf9f12cd"></a>

## Markdown

For some reason, emacs has not a markdown mode enable by default

```emacs-lisp
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
```


<a id="org2837163"></a>

## zen mode

It's a good idea, but breaks a lot of custom config. Maybe I should try to create also a minor mode.

```emacs-lisp
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
```


<a id="orgac0a8c4"></a>

## Configure the latex export

There are a very extensive API which allows you to configure the local and global parameters of the resulting file.

```emacs-lisp
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


```


<a id="org8d2a01a"></a>

## End of Write module

```emacs-lisp
(provide 'lem-write)
;;; lem-write.el ends here
```

```emacs-lisp
(require 'lem-write)
```


<a id="org74e2a2d"></a>

# Org mode


<a id="org96f6399"></a>

## Enable table of content

```emacs-lisp
(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-enable))
```


<a id="orgecd4808"></a>

## Define all the variables

```emacs-lisp
(defconst lem/org-directory
  (concat (cond (is-debian "~/Sync/")
                (is-fedora "~/Documents/")
                (is-termux "~/storage/shared/Documents/")) "Org/"))
```

```emacs-lisp
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
```

**Note** the variable org-startup-folded should be different to `showeverithing` because, this value overwrite other visibility properties for local blocks like `visibility: hidden` or `org-hide-block-startup`

Add some vars borrow from doom-emacs

```emacs-lisp
(setq 
  org-indirect-buffer-display 'current-window
  org-enforce-todo-dependencies t
  org-fontify-done-headline t
  org-fontify-quote-and-verse-blocks t
  org-fontify-whole-heading-line t
  org-tags-columns 0)
```

The org mode is not close


<a id="orgc77f406"></a>

## GTD


<a id="orgc07e5e0"></a>

### Multiple  keyword sets in one file

From [org manual](https://orgmode.org/manual/Multiple-sets-in-one-file.html), sometimes you want to use different sets of TODO keywords in parallel. For example a set for task that could be `DONE` or `TODO`, other task that could depends on other and include the keyword `WAITING` and so on.

IMPORTANT\* You can only use set at time, so you need first to select the correct workflow. The shortcut to select them is: `C-u C-u C-c C-t`; `C-s-RIGHT`; `C-s-LEFT`


<a id="org3afc65d"></a>

### Workflow states

-   **TODO**: A task workflow which should be done, but is not processed
-   **IN PROGRESS**: A task that start by it is not finished
-   **NEXT**: With the GTD flow, the next task to be done
-   **WAIT**: This task depends on other person, so it's not actionable
-   **DONE**: Need explication?

```emacs-lisp
(setq org-todo-keywords '((sequence "TODO(t)" "STRT(s)" "BACK(b)" "|" "DONE(d!)")
                          (sequence "|" "HOLD(h)" "CANCELED(c)")))

```

Also, we can make a hook to start clock in when a task state changes to **IN PROGRESS**

```emacs-lisp
  (defun lem/start-task () 
  "Start a clock when a task change the state from TOOD to IN PROGRESS."
    (when (string= (org-get-todo-state) "STRT")
           (org-clock-in))
    (when (and (string= (org-get-todo-state) "NEXT")
               (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
(add-hook 'org-after-todo-state-change-hook #'lem/start-task)
```


<a id="orgb87f274"></a>

### Tags

Tags helps to filter over all task. This task are mutually exclusive, allowing to determinate its context.

```emacs-lisp
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
```

You can prevent tags inheritance with

```emacs-lisp
(setq org-use-tag-inheritance t ; I want to keep it active
      org-tags-exclude-from-inheritance '("PROJECT"))
```


<a id="org427f72a"></a>

### Agendas

Configure the agenda views

```emacs-lisp
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
```

Org agenda is a mode of emacs that allows you to view the task for the week

**Note 1** You can shcedule the todos with org-shedule command or due time with org-deadline. To move around the date use `Shift+arrows`

**Note 2**: We can get a repeat item ading to the deadline the period of time to be repeat, for example a birthday that is repeat each year (see the agenda file)


<a id="org29e8aba"></a>

### Control time per task

Emacs give you a way to capture the time you spends on each task. You only need go over the task and execute the command `org-clock-in` and when you stop or finish go again over the task and run `org-clock-out`

```emacs-lisp
(setq org-clock-persist t)
(org-clock-persistence-insinuate)
```


<a id="orgd50d4bb"></a>

### Capture template for task

The following templates should be used to customize the behavior of the capture process for new tasks.

```emacs-lisp
(setq org-capture-templates
      `(("t" "Task")
        ("tq" "Task Quick" entry
         (file+headline ,(concat org-directory "Tasks.org") "Inbox")
         "* TODO %?\nAdded at: %U" :empty-lines 1)
        ("tl" "Task With link" entry
         (file+headline ,(concat org-directory "Tasks.org") "Inbox")
         "* TODO %?\nAdded at: %U from %a\n" :empty-lines 1)))
```


<a id="org29609ec"></a>

### Habit

```emacs-lisp
(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60
      org-habit-show-all-today nil
      org-habit-show-habits-only-for-today nil)
```


<a id="org137c3d2"></a>

### Define the agenda view

We can customize who the agenda display the elements with the command `org-agenda-custom-commands`

```emacs-lisp
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
```


<a id="org57e95a6"></a>

## Configure Babel languages

To execute or export code in org-mode code blocks, you’ll need to set up org-babel-load-languages for each language you’d like to use. [This page](https:orgmode.org/worg/org-contrib/babel/languages/index.html) documents all of the languages that you can use with org-babel.

```emacs-lisp
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
```


<a id="org23491ef"></a>

## Structure templates

Org Mode's [structure templates](https://orgmode.org/manual/Structure-Templates.html) feature enables you to quickly insert code blocks into your Org files in combination with `org-tempo` by typing `<` followed by the template name like `el` or `py` and then press `TAB`. For example, to insert an empty `emacs-lisp` block below, you can type `<el` and press `TAB` to expand into such a block.

You can add more `src` block templates below by copying one of the lines and changing the two strings at the end, the first to be the template name and the second to contain the name of the language [as it is known by Org Babel](https://orgmode.org/worg/org-contrib/babel/languages.html).

```emacs-lisp
;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("js" . "src js"))
(add-to-list 'org-structure-template-alist '("ex" . "export"))
(add-to-list 'org-structure-template-alist '("html" . "src html"))
```


<a id="org341c650"></a>

## Fonts and bullets


<a id="orgb8223b2"></a>

### Bullets with org-superstar

Use bullet characters instead of asterisks, plus set the header font sizes to something more palatable. A fair amount of inspiration has been taken from [this blog post](https://zzamboni.org/post/beautifying-org-mode-in-emacs/).

```emacs-lisp
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
```


<a id="orgf193645"></a>

### Increase the size of various heading     :INACTIVE:

```emacs-lisp
(set-face-attribute 'org-document-title nil :font lem-variable :weight 'bold)
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.15)
                (org-level-5 . 1.1)
                (org-level-6 . 1.05)
                (org-level-7 . 1)
                (org-level-8 . 1.0)))
  (set-face-attribute
   (car face) nil
   :font lem-variable :weight 'medium :height (cdr face)))
```


<a id="org7e39a0b"></a>

### Setting monospace fonts for required text

```emacs-lisp
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
```


<a id="orgf4c42d1"></a>

## Org templates

In this subsection, I will add some capture to the capture list, that are not related with any workflow

```emacs-lisp
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
```


<a id="orgb0e1ce1"></a>

## Close org mode configuration

```emacs-lisp
)
```


<a id="orgc08a3a0"></a>

## Update Org Mode Include automatically

Update Org Mode INCLUDE Statements Automatically from [Artur Malabarba](http://endlessparentheses.com/updating-org-mode-include-statements-on-the-fly.html)

```emacs-lisp
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
```


<a id="org96976da"></a>

## Pomodoro

```emacs-lisp
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
```


<a id="org0876121"></a>

## Org-auto-tangle

Org auto-tangle enable tangle the content of a document each time, you save the org file. You need to add the option `#+auto_tangle: t` in the header of the file

```emacs-lisp
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
```


<a id="org3ff6774"></a>

## Auto show markup symbols

This package show the markup symbols when the cursors is between the symbols

```emacs-lisp
(use-package org-appear
  :hook (org-mode . org-appear-mode))
```


<a id="org079187b"></a>

## org evil

```emacs-lisp
(use-package evil-org
  :after org
  :hook ((org-mode . evil-org-mode)
         (org-agenda-mode . evil-org-mode)
         (org-capture-mode . evil-insert-state)
         (evil-org-mode . (lambda () (evil-org-set-key-theme '(navigation todo insert textobjects additional)))))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
```


<a id="orge7671fa"></a>

## Install org ref and gnuplot support

gnuplot is a declarative language that allows you to print graphics in a easy way.

```emacs-lisp
(use-package org-ref)
(use-package gnuplot)
```


<a id="org23c812a"></a>

## Search function

This functions allows to search across the org roam note in any directory. To call them, you should use the `SPC-o-s` shortcuts

```emacs-lisp
;; function to search into the org folder
(defun lem/org-search ()
  (interactive)
  (let ((consult-ripgrep-command "rg --type org --line-buffered --color=always --max-columns=500 --line-number . -e ARG OPTS"))
  (consult-ripgrep org-directory)))
```


<a id="org8eaa6fa"></a>

## org wild notifier

[org wild notifier](https://github.com/akhramov/org-wild-notifier.el) displays notifications based on the org agenda items

```emacs-lisp
(use-package org-wild-notifier
  :after org
  :custom
  (alert-default-style 'libnotify)
  (org-wild-notifier-notification-title "Agenda Reminder")
  :config (org-wild-notifier-mode))
```


<a id="orgb0b8a63"></a>

## Org present     :INACTIVE:

```emacs-lisp
;; Load org-faces to make sure we can set appropriate faces
(defun lem/define-header-size ()
;; Function in charge of ensure the title fonts has a property size
  (dolist (face '((org-level-1 . 2.0)
                  (org-level-2 . 1.8)
                  (org-level-3 . 1.7)
                  (org-level-4 . 1.6)
                  (org-level-5 . 1.5)
                  (org-level-6 . 1.4)
                  (org-level-7 . 1.3)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :weight 'medium :height (cdr face)))
  ;; Make the document title a bit bigger
  (set-face-attribute 'org-document-title nil :weight 'bold :height 1.3))

(defun lem/revert-size ()
  ;; Revert font size changes
  (dolist (face '((org-level-1 . 1.0)
                  (org-level-2 . 1.0)
                  (org-level-3 . 1.0)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.0)
                  (org-level-6 . 1.0)
                  (org-level-7 . 1.0)
                  (org-level-8 . 1.0)))
    (set-face-attribute (car face) nil :weight 'medium :height (cdr face)))
  ;; Make the document title a bit bigger
  (set-face-attribute 'org-document-title nil :weight 'regular :height 1.0))


;; Make sure certain org faces use the fixed-pitch face when variable-pitch-mode is on
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)


(defun lem/org-present-start ()
  (setq-local visual-fill-column-width 110
              visual-fill-column-center-text t)
  ;; Set a blank header line string to create blank space at the top
  (setq header-line-format " ")
  (lem/define-header-size)
  (display-line-numbers-mode 0)
  (visual-fill-column-mode 1)
  (flyspell-mode 0)
  (visual-line-mode 1))

(defun lem/org-present-end ()
  (setq-local face-remapping-alist '((default variable-pitch default)))
  (setq header-line-format nil)
  (lem/revert-size)
  (display-line-numbers-mode 1)
  (visual-line-mode 1)
  (visual-fill-column-mode 0)
  (visual-line-mode 0))

(defun lem/org-present-prepare-slide (buffer-name heading)
  ;; Show only top-level headlines
  (org-overview)
  ;; Unfold the current entry
  (org-show-entry)
  ;; Show only direct subheadings of the slide but don't expand them
  (org-show-children))

(use-package org-present
  :straight (:type git :host github :repo "luelvira/org-present")
  :hook ((org-present-mode . lem/org-present-start)
         (org-present-mode-quit . lem/org-present-end))
  :config
  (add-hook 'org-present-after-navigate-functions 'lem/org-present-prepare-slide))
```


<a id="org682fc7f"></a>

## Org Journal

```emacs-lisp
(use-package org-journal
  :straight t
  :defer t
  :custom
  (org-journal-dir (expand-file-name "Journal" org-directory))
  (org-journal-file-format "%Y-%m-%d")
  (org-journal-enable-encryption nil)
  (org-journal-encrypt-journal nil))
```


<a id="org4316d4a"></a>

## Org export to html


<a id="org672c8b3"></a>

## GFM Exporter

```emacs-lisp
(use-package ox-gfm)
```


<a id="org5cbfee0"></a>

# Org roam

Org-roam is a tool for networked thought. It reproduces some of the Roam Research’s key features within Org-mode.


<a id="orgb571bfe"></a>

## Installation

The instalation process use the melpa or melpa stable package manager from emacs.

```emacs-lisp
(use-package org-roam
  :config
  (setq org-roam-directory (expand-file-name "roam" org-directory)
        org-roam-completion-everywhere t
        org-roam-db-autosync-mode t
        org-roam-list-files-commands '(fd fdfind rg find)
        org-roam-file-extensions '("org" "md")) ;; needed for md-roam
```


<a id="orgb84c30e"></a>

## Configure org roam templates

```emacs-lisp
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
```


<a id="org89ed217"></a>

### Configure org roam completion find function

If you’re using a vertical completion framework, such as Ivy, Org-roam supports the generation of an aligned, tabular completion interface. For example, to include a column for tags, one can set org-roam-node-display-template as such:

```emacs-lisp
(cl-defmethod org-roam-node-date ((node org-roam-node)) (format-time-string "%Y-%m-%d" (org-roam-node-file-mtime node)))

(setq org-roam-node-display-template
      (concat "${title:*} "
              (propertize "${aliases:10}")
              (propertize "${tags:30}"  'face 'org-tag)
              (propertize "${date:10}"  'face 'org-date)))
```


<a id="org8bd6327"></a>

### Configure org roam dailies capture templates

```emacs-lisp
(setq org-roam-dailies-capture-templates
  '(("d" "default" entry "* %<%I:%M %p>:\n%?"
:if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+filetags: jouranl\n\n"))))
```


<a id="orgdc20720"></a>

### Close org roam package declaration

```emacs-lisp
;; Close org roam package declaration
)
```


<a id="orgfa23ea9"></a>

### Some functions used for customize org-roam

```emacs-lisp
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
```


<a id="org1460871"></a>

## Zettelkasten

The zettelkasten methodology offers a set of rules to help you to organize your notes in a way that makes them easy to find. It is based on the idea of establishing links between atomic concepts (each note). On this way, breaks the traditional hierarchical structure based on folders and makes it easier to relate concepts

There are 4 kind of notes:


<a id="orge2d3bbd"></a>

### 1. Fleeting notes

Fleeting notes are thinkings, ideas, concepts and sketch of future notes. They need to be processed and related with another notes. To make it simple, the name of this notes has a prefix with the current date and time, so can be many notes with the same “title”. This method make easy not be distracted by the title instead of the concept.


<a id="org0169866"></a>

### 2. Literature Notes

Literature notes are notes extracted from external source. These must include the reference. These notes have summary or/and highlight from the source, and if it is possible, tray to indicate:

1.  Why this content is relevant?
2.  When you read the source?
3.  In which content do you think it can be useful?

To answer this question, you can use meta-data as header from of the note, a link to the project/area which you think that can be useful and a link to another note with the explanation. This allows you to keep separate the original content to your conclusion and ideas.

1.  Citar

    [Citar](https://github.com/emacs-citar/citar) provides a highly-configurable completing-read front-end to browse and act on BibTeX, BibLaTeX, and CSL JSON bibliographic data, and LaTeX, markdown, and org-cite editing support.
    
    ```emacs-lisp
    (defvar lem/bibliography-files (mapcar
       (lambda (file)
         (expand-file-name file org-directory))
       '("bibliography.bib" "phd.bib"))
      "List of the .bib to get the bibliography.")
    ```
    
    ```emacs-lisp
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
    ```

2.  Citar-org-roam

    This package provides a better integration between citar and org-roam
    
    ```emacs-lisp
    (use-package citar-org-roam
      :after (citar org-roam)
      :config (citar-org-roam-mode)
    ```
    
    1.  Add my custom template
    
        First we need to add a new template for the capture process. I don't know if it need to be set before the package is loaded or after.
        
        ```emacs-lisp
        (add-to-list 'org-roam-capture-templates
                     '("r" "Bibliography reference" plain "* ${citar-title}\n%?"
                       :if-new (file+head "%<%Y%m%d%H%M%S>-${citar-citekey}.org"
                                          "#+TITLE: ${citar-citekey}\n#+AUTHOR: ${citar-author}\n#+cite-date: ${citar-date}\n#+filetags: :LITERATURE:\n#+date: %U\n")
                       :unnarrowed t) t)
        ```
    
    2.  Set the default configuration vars
    
        I can change the default note title output
        
        ```emacs-lisp
        (setq citar-org-roam-note-title-template "${author} - ${title}"
              citar-org-roam-capture-template-key "r")
        ```
    
    3.  Close citar-org-roam
    
        ```emacs-lisp
        )
        ```
        
        References from:
        
        -   <https://www.reddit.com/r/emacs/comments/18qtno9/how_to_autopopulate_journal_name_and_year_from/>
        -   <https://www.reddit.com/r/emacs/comments/15uu70g/how_to_capture_orgroam_template_from_bibliography/>
        -   <https://github.com/org-roam/org-roam-bibtex/discussions/253>
        -   <https://github.com/orgs/emacs-citar/discussions/678>

3.  Import annotations from zotero

    ```emacs-lisp
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
    ```

4.  Custom acronym

    I need if I add a new acronym, this will not be added only on the top of the current buffer, such happens with org-ref. I need the acronym or the glossary entry will be added into the list with all the acronyms.
    
    ```emacs-lisp
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
    ```


<a id="org9c19280"></a>

### 3. Permanent Notes

Permanent notes are stand-alone ideas, that can be made without any direct context to other sourced. Can be made as a recap or summary of the information, but also can be thoughts that popped into your brain while you are working.

The aim of permanent notes is to process the notes you have made and extract ideas, related content and any kind of useful information for you.


<a id="orgf56c428"></a>

### 4. Index Notes

Index notes are these notes used to group connected notes. Can be a TOC, a sort description, or whatever you want.


<a id="org9de490f"></a>

## Org-roam-ui

```emacs-lisp
(use-package org-roam-ui)
```


<a id="org44326c8"></a>

## Combining org roam with markdown syntax!     :INACTIVE:

[md-roam](https://github.com/nobiot/md-roam) is a package (not available in melpa or elpa) aims to allow you the use of markdown file within a org roam database. This feature could help me to combine some options from [obsidian](https://obsidian.md/) with the flexibility of using org roam in emacs.

Lost the links

```emacs-lisp
(use-package md-roam
  :straight (md-roam
             :type git
             :host github
             :repo "nobiot/md-roam")
  :after org-roam
  :config (md-roam-mode 1)
          (setq md-roam-file-extension "md"))
```


<a id="org148d8b3"></a>

# Denote

```emacs-lisp
(use-package denote
  :after org
  :hook (dired-mode . denote-dired-mode-in-directories)
  :config
  (setq denote-directory org-roam-directory
        denote-file-type "org"
        denote-infer-keywords t
        denote-prompts '(title keywords signature)
        denote-dired-directories (list denote-directory)))
```


<a id="org96bce4e"></a>

# End clayemacs

```emacs-lisp
(provide 'clayemacs)
;;; clayemacs.el ends here
```
