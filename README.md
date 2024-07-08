
# Table of Contents

1.  [ClayEMACS](#org4c5cb7b)
    1.  [About](#org4d83ac9)
    2.  [About this README](#org92df802)
    3.  [Enable literature configuration](#orgc7594be)
2.  [Startup](#orge4f44ea)
    1.  [Lexical binding](#orgc9eb8b6)
3.  [Early init](#orgef933a3)
    1.  [Startup performance](#orgb9f9bdf)
        1.  [Disable unnecessary interface](#orga183868)
4.  [Boostrap configuration](#orgd2dcce5)
    1.  [Update load path](#orgb3ea062)
    2.  [Load our modules](#org6b33408)
    3.  [Package system](#org0aa5eb1)
    4.  [Define constants](#org3142bd6)
        1.  [Get environment variables](#org567b612)
        2.  [Get User info](#org40ef1bd)
        3.  [Runtime constants](#orgfd0b7a0)
5.  [Dashboard](#org732bcd1)
6.  [General configuration](#org7ecb797)
    1.  [Keep it clean](#org5b2cb36)
        1.  [No littering](#orgc23aaa3)
    2.  [Startup screen](#org4bfae52)
    3.  [Default encoding](#orgfa0aa5e)
    4.  [Disable warnings when native compilation](#org678c5ad)
    5.  [Recovery](#org2fefca2)
    6.  [History](#org751cadc)
    7.  [Confirmation prompts](#org924b63f)
    8.  [Defaults](#orge5b8354)
    9.  [Set up tramp](#org0cc21e6)
    10. [Emacs as server](#org34657e8)
    11. [Auto revert buffers](#org2728388)
    12. [Maximize windows by default and setup transparency](#orgcf9b053)
    13. [Enable scape instead of C-g](#org26f7862)
    14. [Bookmarks and buffers](#org72c8711)
        1.  [Set up keys](#org316df2e):KEYS:
    15. [Custom functions](#org9b9acd3)
        1.  [Configuration file](#org8cfcd51)
    16. [END OF CORE](#org571d40e):END:
7.  [lem module](#org7e510b8)
    1.  [Define transparency](#org99f7a25)
    2.  [Sync files](#org279aa91)
    3.  [File operations](#org92f96df)
    4.  [Define the key bindings](#org1a16532):KEYS:
    5.  [Reload emacs](#org04881ba)
    6.  [Define the key bindings](#orgfef610a):KEYS:
8.  [Theming](#org99638dc)
    1.  [Reduce distractions](#org88f41ea)
    2.  [Configure lines](#orgcbc3d60)
    3.  [modeline](#orga8e295f)
        1.  [Doom modeline](#org0f02b75)
        2.  [mood line](#org7ccfd27)
    4.  [diminish](#org69bd7ac)
    5.  [Minions](#orgd48b174)
    6.  [create frame hook](#orgeade9f6)
    7.  [Fonts](#orgb133b11)
        1.  [Functions to set up the fonts](#org143161d)
        2.  [Fonts definition](#orgf16c0a5)
        3.  [Ligatures](#org812c348)
        4.  [Setup icons](#org66fb5f1)
    8.  [Global theme](#org6f16a93)
    9.  [Highlights](#orgab7a57d)
    10. [Highlight Matching Braces](#orgec7a99d)
    11. [END OF THEMING](#org1d6e97e):END:
9.  [Keyboard binding](#orgcd2d2a4)
    1.  [Setup evil mode](#org506dfc5)
        1.  [Set the undo system](#orge7cabaf)
        2.  [Set the major mode](#org2373905)
        3.  [Install evil related packages](#org7a28abe)
        4.  [evil-pro(g) mode](#orgfd35b8a)
        5.  [Anzu and vim anzu](#orgf93244a)
    2.  [Which Key](#org827ae0b)
    3.  [Custom shortcut with general](#org4c267d3)
        1.  [Eval expressions](#org9139a23)
        2.  [Bindings for configuration files](#orgaf64757)
        3.  [Dired keybinding](#org9a088bf)
        4.  [File management](#org402531f)
        5.  [Org shortcuts](#org21db62a)
        6.  [Org roam shortcut](#orgfa12d24)
        7.  [Projectile](#orgf3c6e7a)
        8.  [Sync scripts](#orgb2e558d)
        9.  [Toggle options](#org574894c)
        10. [root privileges.](#org3c303df)
        11. [Rebind C-u](#orgeb3d38b)
        12. [vterm commands](#org4d89cf0)
10. [Work Spaces](#org382c213)
11. [Completion system](#org083e50d)
    1.  [Completion at point](#org1f11137)
    2.  [Vertico](#org559546c)
    3.  [Consult](#org19d99a8)
        1.  [Consult hacks](#org81027bc)
        2.  [Consult-dir](#orgc5d9187)
    4.  [Marginalia](#orgaa0a384)
    5.  [Completion action with Embark](#org6b33448)
    6.  [Completion in Regions with Corfu](#orgf1b0e93)
    7.  [Smex](#orge2d1b64)
    8.  [Orderless](#org2533566)
12. [File Management](#org6a10e51)
    1.  [Dired](#orge55f5e8)
    2.  [Peep dired](#org5004cf8)
13. [Development](#org99424d5)
    1.  [Project management](#org7999d19)
        1.  [Git](#org549e570)
    2.  [Linters](#org5db0454)
    3.  [Compilation](#org38f4048)
    4.  [Language server protocol](#org1950cbb)
        1.  [EGLOT](#org75ff607)
    5.  [Language support](#orgfe825b8)
        1.  [Imperative programming](#orgd2e54d0)
        2.  [Functional programming](#orgb926272)
    6.  [Terminals](#org87d70d3)
        1.  [vterm](#orge97e84a)
        2.  [eshell](#orgac97165)
    7.  [Snippets](#org4a9ac78)
    8.  [Time tracking with WakaTime and ActivityWatch](#orgea2912f)
14. [Writing](#org7f36a2f)
    1.  [Install dependencies](#org0c97568)
        1.  [Center text view](#orgbc88d2d)
        2.  [Latex](#org8a7a7b7)
    2.  [Functions](#orgc107d66)
    3.  [Flyspell](#org86488a3)
    4.  [Language tool](#orga0de6c8)
    5.  [Markdown](#org3621628)
    6.  [zen mode](#org1e20149)
    7.  [Configure the latex export](#org2375160)
    8.  [End of Write module](#org327c02c)
15. [Org mode](#org98cf3fa)
    1.  [Enable table of content](#org7433e33)
    2.  [Define all the variables](#orge34c273)
    3.  [GTD](#org2d9d7c3)
        1.  [Multiple  keyword sets in one file](#org7589571)
        2.  [Workflow states](#org317f246)
        3.  [Tags](#org73aaab9)
        4.  [Agendas](#org1eb28bd)
        5.  [Control time per task](#orga1f2578)
        6.  [Capture template for task](#org396549e)
        7.  [Habit](#org3f153c7)
        8.  [Define the agenda view](#orgfe13a98)
    4.  [Configure Babel languages](#org844e36d)
    5.  [Structure templates](#orgaad047b)
    6.  [Fonts and bullets](#orgc86bf53)
        1.  [Bullets with org-superstar](#org8ddf0e9)
        2.  [Increase the size of various heading](#org18dbdb5):INACTIVE:
        3.  [Setting monospace fonts for required text](#org12c3781)
    7.  [Org templates](#orgbbfe6ae)
    8.  [Close org mode configuration](#orgf3a6044)
    9.  [Update Org Mode Include automatically](#orgba6b8a2)
    10. [Pomodoro](#orgdd88e4e)
    11. [Org-auto-tangle](#org18437fb)
    12. [Auto show markup symbols](#org65f575e)
    13. [org evil](#orgb4a87a1)
    14. [Install org ref and gnuplot support](#org80c00ed)
    15. [Search function](#org59ff881)
    16. [org wild notifier](#org6aae4ba)
    17. [Org present](#orgd17a42b):INACTIVE:
    18. [Org Journal](#org722b6ae)
    19. [Org export to html](#org827a414)
    20. [GFM Exporter](#org8e7ec8c)
16. [Org roam](#orgcb8e535)
    1.  [Installation](#org455d7dd)
    2.  [Configure org roam templates](#orga0377b5)
        1.  [Configure org roam completion find function](#org6b1d914)
        2.  [Configure org roam dailies capture templates](#org2faccea)
        3.  [Close org roam package declaration](#orged3962d)
        4.  [Some functions used for customize org-roam](#org02b8394)
    3.  [Zettelkasten](#org3613377)
        1.  [1. Fleeting notes](#org1c65bc5)
        2.  [2. Literature Notes](#orgcc42f5f)
        3.  [3. Permanent Notes](#org4711b03)
        4.  [4. Index Notes](#org23a296d)
    4.  [Org-roam-ui](#org37977ef)
    5.  [Combining org roam with markdown syntax!](#org3a8428c):INACTIVE:
17. [Denote](#org21a723c)
18. [End clayemacs](#org45c6bc6)



<a id="org4c5cb7b"></a>

# ClayEMACS


<a id="org4d83ac9"></a>

## About


<a id="org92df802"></a>

## About this README


<a id="orgc7594be"></a>

## Enable literature configuration

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


<a id="orge4f44ea"></a>

# Startup


<a id="orgc9eb8b6"></a>

## Lexical binding

Lexical binding is a mode that allows to use special features of the languages.
It options tell the configuration that works as a program more than just a
simple configuration

This will generate a header at the top of the tangled file to indicate it is generated and is not meant to be modified directly.

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


<a id="orgef933a3"></a>

# Early init

    <<header>>

The *early-init* file is loaded before any process of emacs, either the package
system. So I will configure the directories used by Emacs to prevent the default
behavior which get dirty the configuration folder.

    ;; SetupFolder
    (defvar private-emacs-directory nil
      "The folder where the Emacs configuration is stored.")
    (setq private-emacs-directory user-emacs-directory
          ;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
          user-emacs-directory (expand-file-name "~/.cache/emacs/")
          url-history-file (expand-file-name "url/history" user-emacs-directory))
    ;; -SetupFolder

Package initialize occurs automatically, before user-init-file is loaded, but
after early-init file. We handle package initialization, so we must prevent
Emacs from doing it early! I use straight as package manager, so I need to
disable the default behavior before the `package.el` is loaded.

    ;; DisablePackage
    (setq package-enable-at-startup nil)
    ;; -DisablePackage


<a id="orgb9f9bdf"></a>

## Startup performance

Make startup faster by reducing the frequency of garbage collection and then use
a hook to measure Emacs startup time.

    ;; DefferGC
    (setq site-run-file nil                  ; No site-wide run-time initializations.
          inhibit-default-init t             ; No site-wide default library
          gc-cons-threshold (* 50 1024 1024) ; The default is 800 kilobytes. Measured in bytes.
          gc-cons-percentage 0.2
          native-comp-eln-load-path (list (expand-file-name "eln-cache" user-emacs-directory)))
    ;; -DefferGC

After change the default values, I need to restore them when Emacs is launched
with the following code in the *init.el* file.

    ;; Profile emacs startup
    (add-hook 'emacs-startup-hook
              (lambda ()
                (setq gc-cons-threshold (* 2 1024 1024)
                      file-name-handler-alist file-name-handler-alist-original)
                (makunbound 'file-name-handler-alist-original)
                (message "*** Emacs loaded in %s seconds with %d garbage collections."
                         (emacs-init-time "%.2f") gcs-done)))

Also, we can prevent launch the hook associated with some files modification in
startup and reenable it after all the process is completed. From [MatthewZMD](https://github.com/MatthewZMD/.emacs.d)

> Every file opened and loaded by Emacs will run through this list to check for a
> proper handler for the file, but during startup, it won’t need any of them.

    ;; FilenameHandler
    (defvar file-name-handler-alist-original file-name-handler-alist)
    (setq file-name-handler-alist nil)
    ;; -FilenameHandler


<a id="orga183868"></a>

### Disable unnecessary interface

    ;; DefaultUI
    (menu-bar-mode -1)
    (unless (and (display-graphic-p) (eq system-type 'darwin))
      (push '(menu-bar-lines . 0) default-frame-alist))
    (push '(tool-bar-lines . 0) default-frame-alist)
    (push '(vertical-scroll-bars) default-frame-alist)
    ;; -DefaultUI

    (provide 'early-init)
    ;;; early-init.el ends here


<a id="orgd2dcce5"></a>

# Boostrap configuration

The init file is the entry point. This file should have the base
setting and import the rest of the modules.

    <<header>>
    
    <<require>>


<a id="orgb3ea062"></a>

## Update load path

Add the lisp script to the path

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


<a id="org6b33408"></a>

## Load our modules

After add the custom path, it is necessary to load the correspondent modules

    ;; InitRequire
    <<init-require>>
    ;; -InitRequire


<a id="org0aa5eb1"></a>

## Package system

    <<header>>

For package management I combine `use-package` with [straight](https://github.com/radian-software/straight.el). To boot the process,
I will disable the checking step that ensure the system has the newest version
of each package.

    ;; Straight
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
    ;; -Straight

In systems different to Linux, I don't use straight, I prefer to use the default
one system.

    ;; DefaultPackageManagement
    (setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
          package-archives
          '(("gnu" . "https://elpa.gnu.org/packages/")
            ("melpa" . "https://melpa.org/packages/")
            ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
    ;; -DefaultPackageManagement

When Emacs uses the default package manager, it is needed to install `use-package`

    
    ;; UsePackage
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
    ;; -UsePackage

Gutter all and export the package

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

    (require 'init-package)


<a id="org3142bd6"></a>

## Define constants

    <<header>>


<a id="org567b612"></a>

### Get environment variables

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
    ;; -MachineInfo


<a id="org40ef1bd"></a>

### Get User info

**Note** I use the git configuration to get this values, but you are free to
customize them.

    ;; UserInfo
    (defvar user-name nil
      "The name to be used in message.")
    
    (setq
      user-mail-address (string-trim (shell-command-to-string "git config --global user.email"))
      user-full-name (string-trim (shell-command-to-string "git config --global user.name"))
      user-name (getenv "USER"))
    ;; -UserInfo


<a id="orgfd0b7a0"></a>

### Runtime constants

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

    (provide 'init-consts)
    ;;; init-consts.el ends here

    (require 'init-consts)


<a id="org732bcd1"></a>

# Dashboard

Emacs Dashboard is an extensible startup screen showing you recent files, bookmarks, agenda items and an Emacs banner.

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


<a id="org7ecb797"></a>

# General configuration


<a id="org5b2cb36"></a>

## Keep it clean

First I define the default emacs back-up where all the cache files will be
stored. I set the emacs directory in early-init to prevent emacs install staffs
inside the config folder. Use no-littering to automatically set common paths to
the new user-emacs-directory. Then define where will be store the temporal files

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

Also I will change the location of the `custom-file.el`, setting it in the config folder

    (setq custom-file (expand-file-name "custom.el" private-emacs-directory))
    (when (file-exists-p custom-file)
      (load custom-file 'noerror 'nomessage))


<a id="orgc23aaa3"></a>

### No littering

    (use-package no-littering
      :demand t
      :config
      (let ((backup-dir (no-littering-expand-var-file-name "backup/")))
        (make-directory backup-dir t)
        (setq backup-directory-alist
              `(("\\`/tmp/" . nil)
                ("\\`/dev/shm/" . nil)
                ("." . ,backup-dir)))))


<a id="org4bfae52"></a>

## Startup screen

    (setq-default inhibit-startup-screen  t
                  inhibit-startup-message t
                  inhibit-startup-echo-area-message user-full-name)


<a id="orgfa0aa5e"></a>

## Default encoding

    ;; Set encding by default
    (set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
    (prefer-coding-system       'utf-8)     ; Add utf-8 at the front for automatic detection.
    (set-terminal-coding-system 'utf-8)     ; Set coding system of terminal output
    (set-keyboard-coding-system 'utf-8)     ; Set coding system for keyboard input on TERMINAL
    (set-language-environment "English")    ; Set up multilingual environment


<a id="org678c5ad"></a>

## Disable warnings when native compilation

    (setq native-comp-async-report-warnings-errors nil)
    ;; Set the right directory to store the native comp cache
    (add-to-list
      'native-comp-eln-load-path
      (expand-file-name "eln-cache/" user-emacs-directory))


<a id="org2fefca2"></a>

## Recovery

If Emacs or the computer crashes, you can recover the files you were editing at
the time of the crash from their auto-save files. To do this, start Emacs again
and type the command M-x recover-session. Here, we parameterize how files are
saved in the background.

    (setq auto-save-list-file-prefix ; Prefix for generating auto-save-list-file-name
          (expand-file-name ".auto-save-list/.saves-" user-emacs-directory)
          auto-save-default t        ; Auto-save every buffer that visits a file
          auto-save-timeout 20       ; Number of seconds between auto-save
          auto-save-interval 200)    ; Number of keystrokes between auto-saves


<a id="org751cadc"></a>

## History

Remove text properties for kill ring entries (see
<https://emacs.stackexchange.com/questions/4187>). This saves a lot of time when
loading it.

    (defun unpropertize-kill-ring ()
      (setq kill-ring (mapcar 'substring-no-properties kill-ring)))
    (add-hook 'kill-emacs-hook 'unpropertize-kill-ring)

Save every possible history

    (require 'savehist)

    (setq history-length 25
          history-delete-duplicates t)
    (savehist-mode 1)
    ;; Remember and restore the last cursor location of opened files
    (save-place-mode 1)

No duplicates in history

    (let (message-log-max)
      (savehist-mode))


<a id="org924b63f"></a>

## Confirmation prompts

    (setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
                  confirm-nonexistent-file-or-buffer nil  ; Ok to visit non existent files
                  confirm-kill-emacs #'y-or-n-p)          ; Confirm before kill emacs


<a id="orge5b8354"></a>

## Defaults

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

Force split vertically

    (setq split-width-threshold 160
          split-height-threshold nil)

Resolve symlinks when opening files, so that any operations are conducted from
the file's true directory (like \`find-file').

    (setq find-file-visit-truename t
          vc-follow-symlinks t)


<a id="org0cc21e6"></a>

## Set up tramp

    (setq tramp-default-method "ssh")


<a id="org34657e8"></a>

## Emacs as server

This command allow to run emacs as server, so all the startup can be done once time and connect client to it each time you need.

    (require 'server)
    (unless (or is-termux
                (server-running-p))
      (server-start))


<a id="org2728388"></a>

## Auto revert buffers

Autorevert enables reload from disk any buffer when it changes. This includes
dired buffers

    (setq global-auto-revert-non-file-buffers t)
    (global-auto-revert-mode 1)


<a id="orgcf9b053"></a>

## Maximize windows by default and setup transparency

In order of maximize the frame and change the transparency I use the
`set-frame-parameter` expression and the `add-to-list 'default-frame-alist`. The
function have been moved to the lisp library

    (unless is-termux
      (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
      (add-to-list 'default-frame-alist '(fullscreen . maximized)))


<a id="org26f7862"></a>

## Enable scape instead of C-g

    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
    ;; By default, Emacs requires you to hit ESC trhee times to escape quit the minibuffer
    (global-set-key [escape] 'keyboard-escape-quit)


<a id="org72c8711"></a>

## Bookmarks and buffers

    (setq bookmark-default-file
          (expand-file-name "bookmarks" user-emacs-directory))


<a id="org316df2e"></a>

### Set up keys     :KEYS:

Use 'SPC b' for keybinings related to bookmarks and buffers

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">list-bookmarks</td>
<td class="org-left">List bookmarks</td>
<td class="org-left">SPC b L</td>
</tr>

<tr>
<td class="org-left">bookmark-set</td>
<td class="org-left">Set bookmark</td>
<td class="org-left">SPC b m</td>
</tr>

<tr>
<td class="org-left">bookmark-delete</td>
<td class="org-left">Delete bookmark</td>
<td class="org-left">SPC b M</td>
</tr>

<tr>
<td class="org-left">bookmark-save</td>
<td class="org-left">Save current bookmark to bookmark file</td>
<td class="org-left">SPC b w</td>
</tr>
</tbody>
</table>

    "b" '(:ignore t        :which-key "buffers/bookmarks")
    "bl" '(bookmark-jump   :which-key "List bookmarks")
    "bm" '(bookmark-set    :which-key "Set bookmark")
    "bd" '(bookmark-delete :which-key "Delete bookmark")
    "bw" '(bookmark-save   :which-key "Save current bookmark to bookmark file")
    "br" '(revert-buffer   :whick-key "Revert buffer")

Regarding *buffers*, the text you are editing in Emacs resides in an object called
a *buffer*. Each time you visit a file, a buffer is used to hold the file’s text.
Each time you invoke Dired, a buffer is used to hold the directory listing.
*Ibuffer* is a program that lists all of your Emacs *buffers*, allowing you to
navigate between them and filter them.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">switch-to-buffer</td>
<td class="org-left">change Buffer</td>
<td class="org-left">SPC b i</td>
</tr>

<tr>
<td class="org-left">kill-buffer</td>
<td class="org-left">Kill current buffer</td>
<td class="org-left">SPC b k</td>
</tr>

<tr>
<td class="org-left">next-buffer</td>
<td class="org-left">Goto next buffer</td>
<td class="org-left">SPC b n</td>
</tr>

<tr>
<td class="org-left">previous-buffer</td>
<td class="org-left">Goto previous buffer</td>
<td class="org-left">SPC b p</td>
</tr>

<tr>
<td class="org-left">save-buffer</td>
<td class="org-left">Save current buffer</td>
<td class="org-left">SPC b s</td>
</tr>
</tbody>
</table>

    "bi" '(switch-to-buffer     :which-key "Switch buffer")
    "bk" '(kill-current-buffer  :whick-key "Kill current buffer")
    "bn" '(next-buffer          :whick-key "Goto next buffer")
    "bp" '(previous-buffer      :whick-key "Goto previous-buffer buffer")
    "bs" '(save-buffer          :whick-key "Save current buffer")


<a id="org9b9acd3"></a>

## Custom functions


<a id="org8cfcd51"></a>

### Configuration file

We can set a shortcut to open the config file from the emacs directory

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


<a id="org571d40e"></a>

## END OF CORE     :END:

    (provide 'lem-core)
    ;;; lem-core.el ends here

    (require 'lem-core)


<a id="org7e510b8"></a>

# lem module

This module contains some custom functions

    (defgroup lem ()
      "Group for some personal variables."
      :prefix  'lem
      :version '0.0.1)


<a id="org99f7a25"></a>

## Define transparency

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


<a id="org279aa91"></a>

## Sync files

I have a script which try to keep sync with a repository on codeberg. This repo
contains the org files only, and it is named sync.

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


<a id="org92f96df"></a>

## File operations

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


<a id="org1a16532"></a>

## Define the key bindings     :KEYS:

    "fD" '(lem/delete-this-file :which-key "Delete current file")
    "fR" '(lem/rename-this-file :which-key "Rename current file")


<a id="org04881ba"></a>

## Reload emacs

    (defun lem/reload-init-file ()
      (interactive)
      (load-file user-init-file)
      (load-file user-init-file))


<a id="orgfef610a"></a>

## Define the key bindings     :KEYS:

    "ER" '(lem/reload-init-file :which-key "Reload init file")


<a id="org99638dc"></a>

# Theming

    <<header>>


<a id="org88f41ea"></a>

## Reduce distractions

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


<a id="orgcbc3d60"></a>

## Configure lines

Set `display-line-numbers-width` to 3 make easy to prevent recalculate the width
with some large files

    (setq-default dispaly-line-numbers-width 3
                  display-line-numbers-widen t)

Enable line numbers for some modes

    (dolist (mode '(text-mode-hook
                    prog-mode-hook
                    conf-mode-hook))
      (add-hook mode (lambda () (display-line-numbers-mode 1))))


<a id="orga8e295f"></a>

## modeline

**NOTE:** The first time you load your configuration on a new machine, you'll need
to run \`M-x all-the-icons-install-fonts\` so that mode line icons display
correctly.

    (setq display-time-format "%H:%M %b %y"
          display-time-default-load-average nil)
    (display-time-mode 1)


<a id="org0f02b75"></a>

### Doom modeline

[doom-modeline](https://github.com/seagle0128/doom-modeline) is a very attractive and rich (yet still minimal) mode line
configuration for Emacs. The default configuration is quite good but you can
check out the [configuration options](https://github.com/seagle0128/doom-modeline#customize) for more things you can enable or disable.

Above there is the config for the doom-modeline

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


<a id="org7ccfd27"></a>

### mood line

[mood line](https://github.com/jessiehildebrandt/mood-line) as alternative to doom modeline

    (use-package mood-line
      :config
      (setq mood-line-glyph-alist mood-line-glyphs-fira-code)
      (mood-line-mode))


<a id="org69bd7ac"></a>

## diminish

The diminish package hides pesky minor modes from the modeline

    (use-package diminish)


<a id="orgd48b174"></a>

## Minions

Minions is a package that implements a nested menu which gives access to all known minor modes

    (use-package minions
      :hook ((doom-modeline-mode mood-line-mode) . minions-mode))


<a id="orgeade9f6"></a>

## create frame hook

Emacs in daemon mode has a problem loading the fonts. By default, the init file
is not read until the first frame is loaded, so the changes on the ui should be
done after it.

Emacs has some `hooks` like the `after-make-frame-functions`, which allows us to
call a function after a frame is created. This function receive as argument the
current frame

    (if (daemonp)
        (add-hook 'after-make-frame-functions
                  (lambda (frame)
                    (lem/set-fonts frame)
                    (lem/set-background frame)))
      (add-hook 'after-init-hook
                (lambda ()
                  (lem/set--fonts)
                  (lem/set-background))))


<a id="orgb133b11"></a>

## Fonts


<a id="org143161d"></a>

### Functions to set up the fonts

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


<a id="orgf16c0a5"></a>

### Fonts definition

Defining the various fonts that Emacs will use.

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


<a id="org812c348"></a>

### Ligatures

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


<a id="org66fb5f1"></a>

### Setup icons

This is an icon set that can be used with dashboard, dired, ibuffer and other Emacs programs.

    (use-package nerd-icons :defer t)
    (use-package nerd-icons-dired
        :defer t
        :hook
        (dired-mode . nerd-icons-dired-mode))
    (use-package nerd-icons-completion
        :defer t
        :config
        (nerd-icons-completion-mode))


<a id="org6f16a93"></a>

## Global theme

[doom-themes](https://github.com/hlissner/emacs-doom-themes) is a great set of themes with a lot of variety and support for many different Emacs modes.

    (use-package doom-themes
      :config
      (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
            doom-themes-enable-italic t) ; if nil, italics is universally disabled
      (doom-themes-visual-bell-config)
      (doom-themes-org-config)
      (load-theme 'doom-dracula t))

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

    (load-theme 'modus-vivendi t)


<a id="orgab7a57d"></a>

## Highlights

    (require 'hl-line)

    (add-hook 'prog-mode-hook #'hl-line-mode)
    (add-hook 'conf-mode-hook #'hl-line-mode)

    (use-package rainbow-delimiters
      :init (setq rainbow-delimiters-max-face-count 4)
      :hook (emacs-lisp-mode . rainbow-delimiters-mode))


<a id="orgec7a99d"></a>

## Highlight Matching Braces

    (use-package paren
      :config
      (setq show-paren-delay 0.1
            show-paren-highlight-openparen t
            show-paren-when-point-inside-paren t
            show-paren-when-point-in-periphery t)
      (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
      (show-paren-mode 1))


<a id="org1d6e97e"></a>

## END OF THEMING     :END:

    (provide 'lem-theme)

    (require 'lem-theme)


<a id="orgcd2d2a4"></a>

# Keyboard binding


<a id="org506dfc5"></a>

## Setup evil mode

Evil mode is a mayor mode that allow to use vim keybindings in emacs

    (global-set-key (kbd "C-M-u") 'universal-argument)


<a id="orge7cabaf"></a>

### Set the undo system

    (use-package undo-tree
    :init (global-undo-tree-mode 1)
    :config
    (setq undo-tree-auto-save-history nil))


<a id="org2373905"></a>

### Set the major mode

This configuration uses [evil-mode](https://evil.readthedocs.io/en/latest/index.html) for a Vi-like modal editing experience.
[general.el](https://github.com/noctuid/general.el) is used for easy keybinding configuration that integrates well with
which-key. [evil-collection](https://github.com/emacs-evil/evil-collection) is used to automatically configure various Emacs
modes with Vi-like keybindings for evil-mode.

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


<a id="org7a28abe"></a>

### Install evil related packages

Evil collection is a package that provide evil keybindings for a lot of modes

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


<a id="orgfd35b8a"></a>

### evil-pro(g) mode

I define a custom minor mode to enable/disable the navigation with the arrows.
Depend's of the context I prefer using one set of keys or another

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


<a id="orgf93244a"></a>

### Anzu and vim anzu

[Anzu](https://github.com/victorteokw/emacs-anzu) is a port of [vim-anzu](https://github.com/osyo-manga/vim-anzu), which provides a minor mode to display *current match*
and *total matches* in the modeline.

    (use-package anzu)
    
    (use-package evil-anzu
      :after evil
      :config (global-anzu-mode +1))


<a id="org827ae0b"></a>

## Which Key

[which-key](https://github.com/justbur/emacs-which-key) is a useful UI panel that appears when you start pressing any key
binding in Emacs to offer you all possible completions for the prefix. For
example, if you press `C-c` (hold control and press the letter `c`), a panel will
appear at the bottom of the frame displaying all of the bindings under that
prefix and which command they run. This is very useful for learning the possible
key bindings in the mode of your current buffer.

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


<a id="org4c267d3"></a>

## Custom shortcut with general

General is a package that provides a more convenient method for binding keys in
emacs

    (use-package general
      :config
      (general-evil-setup t)
      (general-create-definer lem/leader-key-def
        :keymaps '(normal insert visual emacs)
        :prefix "SPC"
        :global-prefix "C-SPC"))
    
    (lem/leader-key-def
      <<keybinding>>)


<a id="org9139a23"></a>

### Eval expressions

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
<th scope="col" class="org-left">shortcut</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">eval-buffer</td>
<td class="org-left">Evaluate the elisp code for the current buffer</td>
<td class="org-left">"eb"</td>
</tr>

<tr>
<td class="org-left">eval-defun</td>
<td class="org-left">Evaluate the current function definition</td>
<td class="org-left">"ed"</td>
</tr>

<tr>
<td class="org-left">eval-expression</td>
<td class="org-left">Open an interactive input to execute a lisp code</td>
<td class="org-left">"ee"</td>
</tr>

<tr>
<td class="org-left">eval-last-sexp</td>
<td class="org-left">Evaluate the last expression</td>
<td class="org-left">"el"</td>
</tr>

<tr>
<td class="org-left">eval-region</td>
<td class="org-left">Evaluate the selected region</td>
<td class="org-left">"er"</td>
</tr>
</tbody>
</table>

    "e" '(:ignore t        :which-key "Eshell/Evaluate")
    "eb" '(eval-buffer     :which-key "Evaluate elisp in buffer")
    "ed" '(eval-defun      :which-key "Evaluate defun containing or after point")
    "ee" '(eval-expression :which-key "Evaluate and elisp expression")
    "el" '(eval-last-sexp  :which-key "Evaluate elisp expression before point")
    "er" '(eval-region     :which-key "Evaluate elisp in region")


<a id="orgaf64757"></a>

### Bindings for configuration files

    "fp" '(lem/go-dotfiles       :which-key "Config")
    "fe" '(:ignore t             :which-key "Emacs files")
    "fec" '(lem/go-emacs-config  :which-key "Emacs Config file")
    "fei" '(lem/go-emacs-init    :which-key "Emacs init file")
    "fem" '(lem/go-emacs-modules :which-key "Custom libraries")


<a id="org9a088bf"></a>

### Dired keybinding

    "d"  '(:ignore t          :which-key "Dired")
    "dd" '(dired              :which-key "Open dired")
    "dj" '(dired-jump         :which-key "Dired jump to current")
    "dp" '(lem/jump-dotfiles  :which-key "Go to dotfiles folder")


<a id="org402531f"></a>

### File management

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
<th scope="col" class="org-left">shortcut</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">View recent files</td>
<td class="org-left">Display recent files</td>
<td class="org-left">r</td>
</tr>

<tr>
<td class="org-left">lem/delete-this-file</td>
<td class="org-left">Delete current file</td>
<td class="org-left">D</td>
</tr>

<tr>
<td class="org-left">lem/rename-this-file</td>
<td class="org-left">Rename current file</td>
<td class="org-left">R</td>
</tr>

<tr>
<td class="org-left">find-file</td>
<td class="org-left">Find files in CW</td>
<td class="org-left">f</td>
</tr>
</tbody>
</table>

    "f" '(:ignore t             :which-key "Files")
    "fD" '(lem/delete-this-file :which-key "Delete current file")
    "fd" '(find-grep-dired      :whick-key "Search for string in files in DIR")
    "ff" '(find-file            :which-key "Find files")
    "fr" '(recentf-open-files   :which-key "Recent files")
    "fR" '(lem/rename-this-file :which-key "Rename current file")


<a id="org21db62a"></a>

### Org shortcuts

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


<a id="orgfa12d24"></a>

### Org roam shortcut

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


<a id="orgf3c6e7a"></a>

### Projectile

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">-</td>
<td class="org-left">Projectile entries</td>
<td class="org-left">p</td>
</tr>

<tr>
<td class="org-left">projectile-find-file</td>
<td class="org-left">Find file inside project</td>
<td class="org-left">pf</td>
</tr>

<tr>
<td class="org-left">projectile-switch-project</td>
<td class="org-left">change to another project</td>
<td class="org-left">ps</td>
</tr>

<tr>
<td class="org-left">consult-ripgrep</td>
<td class="org-left">Search in the project with rg</td>
<td class="org-left">pF</td>
</tr>

<tr>
<td class="org-left">projectile-compile-project</td>
<td class="org-left">compile current project</td>
<td class="org-left">pc</td>
</tr>

<tr>
<td class="org-left">projectile-dired</td>
<td class="org-left">open dired in project root</td>
<td class="org-left">pd</td>
</tr>
</tbody>
</table>

    "p"  '(:ignore t                  :which-key "Projectile")
    "pf" '(projectile-find-file       :which-key "Projectile find file")
    "ps" '(projectile-switch-project  :which-key "Projectile switch project")
    "pF" '(consult-ripgrep            :which-key "Rip grep")
    "pc" '(projectile-compile-project :which-key "Compile Project")
    "pd" '(projectile-dired           :which-key "Projectile dired")


<a id="orgb2e558d"></a>

### Sync scripts

    "s" '(:ignore t      :which-key "sync")
    "so" '(lem/sync-org  :which-key "Sync org files")
    "sc" '(lem/sync-conf :which-key "Sync config folder")
    "sb" '(org-roam-db-sync :whick-key "Reload org roam DB")


<a id="org574894c"></a>

### Toggle options

    "t"  '(:ignore t                   :which-key "toggles")
    "tw" '(whitespace-mode             :which-key "whitespace")
    "td" '(lem-write-switch-dictionary :which-key "Toggle between dictionaries")
    "tt" '(lem/toggle-transparency     :which-key "Toggle between transparency states")
    "tl" '(org-toggle-link-display     :which-key "Toggle org link display")
    "tL" '(display-line-numbers-mode   :which-key "Toggle display line numbers")
    "tf" '(auto-fill-mode              :which-key "Toggle autofill mode")


<a id="org3c303df"></a>

### root privileges.

    "r" '(:ignore t :which-key "sudo edit")
    "rf" '(sudo-edit-find-file :which-key "Sudo find file")
    "rF" '(sudo=edit :which-key "sudo edit current file")


<a id="orgeb3d38b"></a>

### Rebind C-u

Emacs by default use C-u for the universal-argument command, so if I want to
keep the default behavior of vi, I need to rebind it.

    "u" '(universal-argument :which-key "Universal argument")


<a id="org4d89cf0"></a>

### vterm commands

    "v" '(:ignore t            :which-key "Vterminal")
    "vt" '(multi-vterm         :which-key "Open vterm in same window")
    "vT" '(vterm-other-window  :which-key "Open vterm in other window")


<a id="org382c213"></a>

# Work Spaces

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


<a id="org083e50d"></a>

# Completion system


<a id="org1f11137"></a>

## Completion at point

Cape is a completion at point extension.

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

Overwrite the completion at point shortcut of evil-mode. The default system
works better to your use.

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


<a id="org559546c"></a>

## Vertico

[Vertico](https://github.com/minad/vertico) provides a performant and minimalistic vertical completion UI
based on the default completion system but aims to be highly flexible,
extensible and modular.

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


<a id="org19d99a8"></a>

## Consult

Consult provides a lot of useful completion commands similar to Ivy’s Counsel.

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


<a id="org81027bc"></a>

### Consult hacks

For the [consult-goto-line](help:consult-goto-line) and `consult-line` commands, we define our
owns with live preview (independently of the [consult-preview-key](help:consult-preview-key))
([Example from rougier](https://github.com/rougier/dotemacs/blob/37a22e94b39bc0c2965c40b3ec331438f04d1efe/dotemacs.org?plain=1#L2007))

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

The consult wiki has a demo for the find file function with preview

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


<a id="orgc5d9187"></a>

### Consult-dir

    (use-package consult-dir
      :straight t
      :bind (([remap list-directory] . consult-dir)
             :map vertico-map
             ("C-x C-d" . consult-dir)
             ("C-x C-j" . consult-dir-jump-file))
      :custom
      (consult-dir-project-list-function nil))


<a id="orgaa0a384"></a>

## Marginalia

[Marginalia](https://github.com/minad/marginalia) add annotations at the margin of the minibuffer, like ivy-rich, but for [vertico](#org559546c)

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


<a id="org6b33448"></a>

## Completion action with Embark

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


<a id="orgf1b0e93"></a>

## Completion in Regions with Corfu


<a id="orge2d1b64"></a>

## Smex

Smex is a package that makes M-x remember out history

    (use-package smex
      :config
      (smex-initialize))


<a id="org2533566"></a>

## Orderless

[Orderless](https://github.com/oantolin/orderless) improves candidate filtering create pattern by words
separate with spaces and display any command which has the same words
in any order

    (use-package orderless
      :init
      (setq completion-styles '(orderless basic)
            completion-category-defaults nil
            completion-category-overrides '((file (styles basic partial-completion)))))


<a id="org6a10e51"></a>

# File Management


<a id="orge55f5e8"></a>

## Dired

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


<a id="org5004cf8"></a>

## Peep dired

    (use-package peep-dired
      :after t
      :hook (evil-normalize-keymaps . peep-dired-hook)
      :config
        (evil-define-key 'normal peep-dired-mode-map (kbd "C-j") 'peep-dired-next-file)
        (evil-define-key 'normal peep-dired-mode-map (kbd "C-k") 'peep-dired-prev-file))


<a id="org99424d5"></a>

# Development


<a id="org7999d19"></a>

## Project management

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


<a id="org549e570"></a>

### Git

1.  Magit

        (if (version< emacs-version "29.0")
          (use-package seq))
        (use-package magit)

2.  Git gutter

    Git gutter is a software which make easy to view the difference between a file and the last commit from the same file.
    
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
    
    [git-timemachine](https://github.com/emacsmirror/git-timemachine) is a program that allows you to move backwards and forwards through a file's commits. Use `SPC g t` to open time machine, and, in normal mode, `C-j` and `C-k` to move forward the changes on the current file
    
        (use-package git-timemachine
        :hook (evil-normalize-keymaps . git-timemachine-hook)
        :config
            (evil-define-key 'normal git-timemachine-mode-map (kbd "C-j") 'git-timemachine-show-previous-revision)
            (evil-define-key 'normal git-timemachine-mode-map (kbd "C-k") 'git-timemachine-show-next-revision))

3.  Git commit

    [Git commit](https://github.com/magit/magit/blob/master/lisp/git-commit.el) forces you to follow the commits message conventions
    
        (use-package git-commit
          :ensure nil
          :preface
          (defun my/git-commit-auto-fill-everywhere ()
            "Ensure that the commit body does not exceed 72 characters."
            (setq fill-column 72)
            (setq-local comment-auto-fill-only-comments nil))
          :hook (git-commit-mode . my/git-commit-auto-fill-everywhere)
          :custom (git-commit-summary-max-length 50))

4.  Ediff

    `ediff` is a diff program that is built into Emacs.  By default, ‘ediff’ splits files vertically and places the ‘help’ frame in its own window.  I have changed this so the two files are split horizontally and the `help` frame appears as a lower split within the existing window.  Also, I create my own ‘dt-ediff-hook’ where I add `j/k` for moving to next/prev diffs.  By default, this is set to `n/p`.
    
        (setq ediff-split-window-function 'split-window-horizontally
              ediff-window-setup-function 'ediff-setup-windows-plain)
        
        (defun dt-ediff-hook ()
          (ediff-setup-keymap)
          (define-key ediff-mode-map "j" 'ediff-next-difference)
          (define-key ediff-mode-map "k" 'ediff-previous-difference))
        
        (add-hook 'ediff-mode-hook 'dt-ediff-hook)

5.  General keybinding for (ma)git

    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <thead>
    <tr>
    <th scope="col" class="org-left">COMMAND</th>
    <th scope="col" class="org-left">DESCRIPTION</th>
    <th scope="col" class="org-left">KEYBINDING</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td class="org-left">magit-status</td>
    <td class="org-left">launch magit</td>
    <td class="org-left">gs</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-diff-unstaged</td>
    <td class="org-left">git diff</td>
    <td class="org-left">gd</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-branch-or-checkout</td>
    <td class="org-left">git checkout</td>
    <td class="org-left">gc</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-log-current</td>
    <td class="org-left">git log</td>
    <td class="org-left">glc</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-log-buffer-file</td>
    <td class="org-left">git log current file</td>
    <td class="org-left">glf</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-branch</td>
    <td class="org-left">git branch</td>
    <td class="org-left">gb</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-push-current</td>
    <td class="org-left">git push</td>
    <td class="org-left">gP</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-pull-branch</td>
    <td class="org-left">git pull</td>
    <td class="org-left">gp</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-fetch</td>
    <td class="org-left">git fetch</td>
    <td class="org-left">gf</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-fetch-all</td>
    <td class="org-left">git fetch &#x2013;all</td>
    <td class="org-left">gF</td>
    </tr>
    
    <tr>
    <td class="org-left">magit-rebase</td>
    <td class="org-left">git rebase</td>
    <td class="org-left">gr</td>
    </tr>
    </tbody>
    </table>
    
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


<a id="org5db0454"></a>

## Linters

Install `luacheck` from your Linux distro's repositories for flycheck to
work correctly with lua files.  Install `python-pylint` for flycheck to
work with python files.  Haskell works with flycheck as long as
`haskell-ghc` or `haskell-stack-ghc` is installed.  For more information
on language support for flycheck, [read this](https://www.flycheck.org/en/latest/languages.html).

    (use-package flycheck
      :straight t
      :defer t
      :diminish
      :init (global-flycheck-mode))

Origami is a module that allows you to fold the code

    (use-package origami
      :hook (prog-mode . origami-mode))

Subwords allows you to interact with camelCase words as separate words

    (use-package subword
      :config (global-subword-mode 1))


<a id="org38f4048"></a>

## Compilation

    (use-package compile
      :straight nil
      :custom
      (compilation-scroll-output t))
    
    (defun auto-recompile-buffer ()
      (interactive)
      (if (member #'recompile after-save-hook)
          (remove-hook 'after-save-hook #'recompile t)
        (add-hook 'after-save-hook #'recompile nil t)))


<a id="org1950cbb"></a>

## Language server protocol


<a id="org75ff607"></a>

### EGLOT

[eglot](https://github.com/joaotavora/eglot) is lsp client for emacs that in meacs 29 will (is) part of the core of emacs

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


<a id="orgfe825b8"></a>

## Language support

I want to group each languages by its paradigm


<a id="orgd2e54d0"></a>

### Imperative programming

1.  Python

        (use-package python-mode
          :init
          (setq python-indent-guess-indent-offset t
                python-indent-guess-indent-offset-verbose nil
                python-shell-interpreter "python3"))
    
    Use pyvenv to manage and use `virtualenv`. Run `pyvenv-activate` to
    configure Emacs to cause `lsp-mode` to use virtual environment.
    
        (use-package pyvenv
          :init (setenv "WORKON_HOME" "~/.pyenv/versions")
          :config
          (pyvenv-mode 1)
          (add-hook 'python-mode-local-vars-hook #'pyvenv-track-virtualenv)
          (add-to-list 'global-mode-string
                       '(pyvenv-virtual-env-name (" venv:" pyvenv-virtual-env-name " "))
                       'append))
    
    1.  lsp for python
    
            (use-package lsp-pyright :ensure t)

2.  WEB

    1.  JavaScript/TypeScript
    
        There are a lot of package aimed to work with js/ts code. Some of
        theme are `js-mode`, `js2-mode`, `web-mode`&#x2026; For javascript files I will
        use js2-mode because this is the one used by other frameworks such
        doom emacs. And, for editing html and css related files, `web-mode`
        
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
        
        For formatting the js code, I think the best tool is [prettier](https://prettier.io/).
        
            (use-package prettier-js
              :custom (prettier-js-args '("--print-width" "100"
                                          "--single-quote" "true"
                                          "--trailing-comma" "all"))
              :config
              (setq prettier-js-show-errors nil))
        
        [js2-refactor](https://github.com/js-emacs/js2-refactor.el) provides a small list of refactoring functions for JavaScript in Emacs
        
            (use-package js2-refactor
              :hook ((js2-mode rjsx-mode) . js2-refactor-mode))
        
        Sometimes I need to work with typescript&#x2026;
        
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
        
        And with react
        
            (use-package rjsx-mode)
    
    2.  HTML and CSS
    
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
        
        Also we can enable [simple-http](https://github.com/skeeto/emacs-web-server/tree/master) to create a server in the current path
        and use [impatient mode](https://github.com/skeeto/impatient-mode/tree/master) like a live server.
        
        Also [skewer](https://github.com/skeeto/skewer-mode/tree/master) provides a live interaction with JavaScript, CSS, and
        HTML.
        
        These package don't work as I expect. They have a lot of problem
        rendering png image or loading external scripts.
        
            (use-package simple-httpd :defer t)
            (use-package impatient-mode :defer t)
            (use-package skewer-mode :defer t)
        
        Another package that could be helpful
        
            (use-package rainbow-mode
              :hook ((css-mode sass-mode) . rainbow-mode))
            (use-package sass-mode)


<a id="orgb926272"></a>

### Functional programming

1.  elisp mode

    This is a small configuration to make evil-shift-width to 2 in `emacs lisp mode`
    
        (add-hook 'emacs-lisp-mode-hook  #'(lambda () (setq evil-shift-width 2)))

2.  Clojure

        (use-package clojure-mode)
        (use-package cider
          :after clojure-mode)
        (use-package inf-clojure
          :after cider)

3.  Haskell

        (use-package haskell-mode
          :config
          (setq haskell-process-suggest-remove-import-lines t
                haskell-process-auto-import-loaded-modules t
                haskell-process-show-overlays nil
                haskell-process-type 'cabal-repl
        ))

4.  PureScript

        (use-package purescript-mode
          :config
          (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
          (add-hook 'purescript-mode-hook 'flycheck-mode))
        
        (use-package psc-ide
          :hook (purescript-mode . psc-ide-mode)
          :config
          (remove-hook 'company-backends 'company-psc-ide-backend)
          (psc-ide-flycheck-setup))


<a id="org87d70d3"></a>

## Terminals


<a id="orge97e84a"></a>

### vterm

vterm enables the use of fully-fledged terminal applications within Emacs so
that I don't need an external terminal emulator.

It need to be compiled, so you need to install first some dependencies

    apt install make cmake libterm-bin libterm

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


<a id="orgac97165"></a>

### eshell

    (use-package eshell
      :straight nil
      (define-key eshell-mode-map (kbd "<tab>") 'completion-at-point))


<a id="org4a9ac78"></a>

## Snippets

Snippets are a short text which is enabled to be expanded. yasnippet
provide the mechanism, but does not have the snippets. You need to
lead them. I will try with yasnippet-snippets and doom-snippets. The
first one use the < character at the begin of the text, while
doom-snippets not.

      (use-package yasnippet
        :defer t
        :config
        (delq 'yas-dropdown-prompt yas-prompt-functions)
        (yas-global-mode 1))
    
      (use-package yasnippet-snippets)
    
    (use-package doom-snippets
      :after yasnippet
      :straight (doom-snippets :type git :host github :repo "doomemacs/snippets" :files ("*.el" "*")))


<a id="orgea2912f"></a>

## Time tracking with WakaTime and ActivityWatch

Wakatime is an opensource software aims at provide you metrics about the time
you spend codding in the different projects you have.

    (use-package wakatime-mode
      :straight t
      :config
      (global-wakatime-mode))

    (use-package activity-watch-mode
    :disabled
    :straight t
    :config
    (global-activity-watch-mode))


<a id="org7f36a2f"></a>

# Writing

    <<header>>


<a id="org0c97568"></a>

## Install dependencies


<a id="orgbc88d2d"></a>

### Center text view

    (use-package visual-fill-column)


<a id="org8a7a7b7"></a>

### Latex

    (use-package auctex)
    (use-package cdlatex)


<a id="orgc107d66"></a>

## Functions

We can configure multiples dictionaries and toggle between them

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

Every time emacs enter in text-mode, call this function which set the
fill-column to the customize-value, enable the `variable-pitch-mode` and active
the autofill. Autofill is disable in `org-mode` because I use to have code
snippets.

    (defun lem-write-text-mode-setup ()
      (interactive)
      (setq evil-auto-indent nil)
      (variable-pitch-mode 1)
      (auto-fill-mode 1))
    
    (add-hook 'text-mode-hook 'lem-write-text-mode-setup)


<a id="org86488a3"></a>

## Flyspell

Flyspell is a mode that allows you to see typing errors. By default it is
disable, but can be configure to be used on different kinds of situations.

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


<a id="orga0de6c8"></a>

## Language tool

Language tool is a software that check both, grammar and spelling in different
languages.

    curl https://languagetool.org/download/LanguageTool-stable.zip -o /tmp/LanguageTool-stable.zip
    mkdir -p ~/.local/lib/
    unzip /tmp/LanguageTool-stable.zip -d ~/.local/lib/languageTool

    (when lem-write-langtool-p
      (use-package langtool
      :config
      (setq langtool-language-tool-jar lem-write-langtool-path
            langtool-default-language (nth lem-write-dictionaries-pos lem-write-dictionaries-list))))


<a id="org3621628"></a>

## Markdown

For some reason, emacs has not a  markdown mode enable by default

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


<a id="org1e20149"></a>

## zen mode

It's a good idea, but breaks a lot of custom config. Maybe I should try to create also a minor mode.

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


<a id="org2375160"></a>

## Configure the latex export

There are a very extensive API which allows you to configure the local and
global parameters of the resulting file.

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


<a id="org327c02c"></a>

## End of Write module

    (provide 'lem-write)
    ;;; lem-write.el ends here

    (require 'lem-write)


<a id="org98cf3fa"></a>

# Org mode


<a id="org7433e33"></a>

## Enable table of content

    (use-package toc-org
      :commands toc-org-enable
      :hook (org-mode . toc-org-enable))


<a id="orge34c273"></a>

## Define all the variables

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

**Note** the variable org-startup-folded should be different to `showeverithing` because, this value overwrite other visibility properties for local blocks like `visibility: hidden` or `org-hide-block-startup`

Add some vars borrow from doom-emacs

    (setq 
      org-indirect-buffer-display 'current-window
      org-enforce-todo-dependencies t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t
      org-fontify-whole-heading-line t
      org-tags-columns 0)

The org mode is not close


<a id="org2d9d7c3"></a>

## GTD


<a id="org7589571"></a>

### Multiple  keyword sets in one file

From [org manual](https://orgmode.org/manual/Multiple-sets-in-one-file.html), sometimes you want to use different sets of TODO keywords in parallel. For example a set for task that could be `DONE` or `TODO`, other task that could depends on other and include the keyword `WAITING` and so on.

IMPORTANT\* You can only use set at time, so you need first to select the correct workflow. The shortcut to select them is: `C-u C-u C-c C-t`; `C-s-RIGHT`; `C-s-LEFT`


<a id="org317f246"></a>

### Workflow states

-   **TODO**: A task workflow which should be done, but is not processed
-   **IN PROGRESS**: A task that start by it is not finished
-   **NEXT**: With the GTD flow, the next task to be done
-   **WAIT**: This task depends on other person, so it's not actionable
-   **DONE**: Need explication?

    (setq org-todo-keywords '((sequence "TODO(t)" "STRT(s)" "BACK(b)" "|" "DONE(d!)")
                              (sequence "|" "HOLD(h)" "CANCELED(c)")))

Also, we can make a hook to start clock in when a task state changes to **IN PROGRESS**

      (defun lem/start-task () 
      "Start a clock when a task change the state from TOOD to IN PROGRESS."
        (when (string= (org-get-todo-state) "STRT")
               (org-clock-in))
        (when (and (string= (org-get-todo-state) "NEXT")
                   (not (org-entry-get nil "ACTIVATED")))
        (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
    (add-hook 'org-after-todo-state-change-hook #'lem/start-task)


<a id="org73aaab9"></a>

### Tags

Tags helps to filter over all task. This task are mutually exclusive, allowing to determinate its context.

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

You can prevent tags inheritance with

    (setq org-use-tag-inheritance t ; I want to keep it active
          org-tags-exclude-from-inheritance '("PROJECT"))


<a id="org1eb28bd"></a>

### Agendas

Configure the agenda views

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

Org agenda is a mode of emacs that allows you to view the task for the week

**Note 1** You can shcedule the todos with org-shedule command or due time with org-deadline. To move around the date use `Shift+arrows`

**Note 2**: We can get a repeat item ading to the deadline the period of time to be repeat, for example a birthday that is repeat each year (see the agenda file)


<a id="orga1f2578"></a>

### Control time per task

Emacs give you a way to capture the time you spends on each task. You only need go over the task and execute the command `org-clock-in` and when you stop or finish go again over the task and run `org-clock-out`

    (setq org-clock-persist t)
    (org-clock-persistence-insinuate)


<a id="org396549e"></a>

### Capture template for task

The following templates should be used to customize the behavior of the capture process for new tasks.

    (setq org-capture-templates
          `(("t" "Task")
            ("tq" "Task Quick" entry
             (file+headline ,(concat org-directory "Tasks.org") "Inbox")
             "* TODO %?\nAdded at: %U" :empty-lines 1)
            ("tl" "Task With link" entry
             (file+headline ,(concat org-directory "Tasks.org") "Inbox")
             "* TODO %?\nAdded at: %U from %a\n" :empty-lines 1)))


<a id="org3f153c7"></a>

### Habit

    (require 'org-habit)
    (add-to-list 'org-modules 'org-habit)
    (setq org-habit-graph-column 60
          org-habit-show-all-today nil
          org-habit-show-habits-only-for-today nil)


<a id="orgfe13a98"></a>

### Define the agenda view

We can customize who the agenda display the elements with the command `org-agenda-custom-commands`

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


<a id="org844e36d"></a>

## Configure Babel languages

To execute or export code in org-mode code blocks, you’ll need to set up
org-babel-load-languages for each language you’d like to use.
[This page](https:orgmode.org/worg/org-contrib/babel/languages/index.html) documents all of the languages that you can use with org-babel.

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


<a id="orgaad047b"></a>

## Structure templates

Org Mode's [structure templates](https://orgmode.org/manual/Structure-Templates.html) feature enables you to quickly insert code blocks into your Org files in combination with `org-tempo` by typing `<` followed by the template name like `el` or `py` and then press `TAB`.  For example, to insert an empty `emacs-lisp` block below, you can type `<el` and press `TAB` to expand into such a block.

You can add more `src` block templates below by copying one of the lines and changing the two strings at the end, the first to be the template name and the second to contain the name of the language [as it is known by Org Babel](https://orgmode.org/worg/org-contrib/babel/languages.html).

    ;; This is needed as of Org 9.2
    (require 'org-tempo)
    
    (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
    (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
    (add-to-list 'org-structure-template-alist '("py" . "src python"))
    (add-to-list 'org-structure-template-alist '("js" . "src js"))
    (add-to-list 'org-structure-template-alist '("ex" . "export"))
    (add-to-list 'org-structure-template-alist '("html" . "src html"))


<a id="orgc86bf53"></a>

## Fonts and bullets


<a id="org8ddf0e9"></a>

### Bullets with org-superstar

Use bullet characters instead of asterisks, plus set the header font sizes to something more palatable. A fair amount of inspiration has been taken from [this blog post](https://zzamboni.org/post/beautifying-org-mode-in-emacs/).

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


<a id="org18dbdb5"></a>

### Increase the size of various heading     :INACTIVE:

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


<a id="org12c3781"></a>

### Setting monospace fonts for required text

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


<a id="orgbbfe6ae"></a>

## Org templates

In this subsection, I will add some capture to the capture list, that are not related with any workflow

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


<a id="orgf3a6044"></a>

## Close org mode configuration

    )


<a id="orgba6b8a2"></a>

## Update Org Mode Include automatically

Update Org Mode INCLUDE Statements Automatically from [Artur Malabarba](http://endlessparentheses.com/updating-org-mode-include-statements-on-the-fly.html)

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


<a id="orgdd88e4e"></a>

## Pomodoro

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


<a id="org18437fb"></a>

## Org-auto-tangle

Org  auto-tangle enable tangle the content of a document each time, you save the
org file. You need to add the option `#+auto_tangle: t` in the header of the file

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


<a id="org65f575e"></a>

## Auto show markup symbols

This package show the markup symbols when the cursors is between the symbols

    (use-package org-appear
      :hook (org-mode . org-appear-mode))


<a id="orgb4a87a1"></a>

## org evil

    (use-package evil-org
      :after org
      :hook ((org-mode . evil-org-mode)
             (org-agenda-mode . evil-org-mode)
             (org-capture-mode . evil-insert-state)
             (evil-org-mode . (lambda () (evil-org-set-key-theme '(navigation todo insert textobjects additional)))))
      :config
      (require 'evil-org-agenda)
      (evil-org-agenda-set-keys))


<a id="org80c00ed"></a>

## Install org ref and gnuplot support

gnuplot is a declarative language that allows you to print graphics in a easy way.

    (use-package org-ref)
    (use-package gnuplot)


<a id="org59ff881"></a>

## Search function

This functions allows to search across the org roam note in any directory. To
call them, you should use the `SPC-o-s` shortcuts

    ;; function to search into the org folder
    (defun lem/org-search ()
      (interactive)
      (let ((consult-ripgrep-command "rg --type org --line-buffered --color=always --max-columns=500 --line-number . -e ARG OPTS"))
      (consult-ripgrep org-directory)))


<a id="org6aae4ba"></a>

## org wild notifier

[org wild notifier](https://github.com/akhramov/org-wild-notifier.el) displays notifications based on the org agenda items

    (use-package org-wild-notifier
      :after org
      :custom
      (alert-default-style 'libnotify)
      (org-wild-notifier-notification-title "Agenda Reminder")
      :config (org-wild-notifier-mode))


<a id="orgd17a42b"></a>

## Org present     :INACTIVE:

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


<a id="org722b6ae"></a>

## Org Journal

    (use-package org-journal
      :straight t
      :defer t
      :custom
      (org-journal-dir (expand-file-name "Journal" org-directory))
      (org-journal-file-format "%Y-%m-%d")
      (org-journal-enable-encryption nil)
      (org-journal-encrypt-journal nil))


<a id="org827a414"></a>

## Org export to html


<a id="org8e7ec8c"></a>

## GFM Exporter

    (use-package ox-gfm)


<a id="orgcb8e535"></a>

# Org roam

Org-roam is a tool for networked thought. It reproduces some of the Roam
Research’s key features within Org-mode.


<a id="org455d7dd"></a>

## Installation

The instalation process use the melpa or melpa stable package manager from emacs.

    (use-package org-roam
      :config
      (setq org-roam-directory (expand-file-name "roam" org-directory)
            org-roam-completion-everywhere t
            org-roam-db-autosync-mode t
            org-roam-list-files-commands '(fd fdfind rg find)
            org-roam-file-extensions '("org" "md")) ;; needed for md-roam


<a id="orga0377b5"></a>

## Configure org roam templates

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


<a id="org6b1d914"></a>

### Configure org roam completion find function

If you’re using a vertical completion framework, such as Ivy, Org-roam supports the generation of an aligned, tabular completion interface. For example, to include a column for tags, one can set org-roam-node-display-template as such:

    (cl-defmethod org-roam-node-date ((node org-roam-node)) (format-time-string "%Y-%m-%d" (org-roam-node-file-mtime node)))
    
    (setq org-roam-node-display-template
          (concat "${title:*} "
                  (propertize "${aliases:10}")
                  (propertize "${tags:30}"  'face 'org-tag)
                  (propertize "${date:10}"  'face 'org-date)))


<a id="org2faccea"></a>

### Configure org roam dailies capture templates

    (setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%I:%M %p>:\n%?"
    :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+filetags: jouranl\n\n"))))


<a id="orged3962d"></a>

### Close org roam package declaration

    ;; Close org roam package declaration
    )


<a id="org02b8394"></a>

### Some functions used for customize org-roam

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


<a id="org3613377"></a>

## Zettelkasten

The zettelkasten methodology offers a set of rules to help you to organize your notes in a way that makes them easy to find. It is based on the idea of establishing links between atomic concepts (each note). On this way, breaks the traditional hierarchical structure based on folders and makes it easier to relate concepts

There are 4 kind of notes:


<a id="org1c65bc5"></a>

### 1. Fleeting notes

Fleeting notes are thinkings, ideas, concepts and sketch of future notes. They need to be processed and related with another notes. To make it simple, the name of this notes has a prefix with the current date and time, so can be many notes with the same “title”. This method make easy not be distracted by the title instead of the concept.


<a id="orgcc42f5f"></a>

### 2. Literature Notes

Literature notes are notes extracted from external source. These must include the reference. These notes have summary or/and highlight from the source, and if it is possible, tray to indicate:

1.  Why this content is relevant?
2.  When you read the source?
3.  In which content do you think it can be useful?

To answer this question, you can use meta-data as header from of the note, a link to the project/area which you think that can be useful and a link to another note with the explanation. This allows you to keep separate the original content to your conclusion and ideas.

1.  Citar

    [Citar](https://github.com/emacs-citar/citar) provides a highly-configurable completing-read front-end to browse and act on BibTeX, BibLaTeX, and CSL JSON
    bibliographic data, and LaTeX, markdown, and org-cite editing support.
    
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

2.  Citar-org-roam

    This package provides a better integration between citar and org-roam
    
        (use-package citar-org-roam
          :after (citar org-roam)
          :config (citar-org-roam-mode)
    
    1.  Add my custom template
    
        First we need to add a new template for the capture process. I don't know if it need to be set before the package is loaded or after.
        
            (add-to-list 'org-roam-capture-templates
                         '("r" "Bibliography reference" plain "* ${citar-title}\n%?"
                           :if-new (file+head "%<%Y%m%d%H%M%S>-${citar-citekey}.org"
                                              "#+TITLE: ${citar-citekey}\n#+AUTHOR: ${citar-author}\n#+cite-date: ${citar-date}\n#+filetags: :LITERATURE:\n#+date: %U\n")
                           :unnarrowed t) t)
    
    2.  Set the default configuration vars
    
        I can change the default note title output
        
            (setq citar-org-roam-note-title-template "${author} - ${title}"
                  citar-org-roam-capture-template-key "r")
    
    3.  Close citar-org-roam
    
            )
        
        References from:
        
        -   <https://www.reddit.com/r/emacs/comments/18qtno9/how_to_autopopulate_journal_name_and_year_from/>
        -   <https://www.reddit.com/r/emacs/comments/15uu70g/how_to_capture_orgroam_template_from_bibliography/>
        -   <https://github.com/org-roam/org-roam-bibtex/discussions/253>
        -   <https://github.com/orgs/emacs-citar/discussions/678>

3.  Import annotations from zotero

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

4.  Custom acronym

    I need if I add a new acronym, this will not be added only on the top of the current buffer, such happens with org-ref. I need the acronym or the glossary entry will be added into the list with all the acronyms.
    
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


<a id="org4711b03"></a>

### 3. Permanent Notes

Permanent notes are stand-alone ideas, that can be made without any direct context to other sourced. Can be made as a recap or summary of the information, but also can be thoughts that popped into your brain while you are working.

The aim of permanent notes is to process the notes you have made and extract ideas, related content and any kind of useful information for you.


<a id="org23a296d"></a>

### 4. Index Notes

Index notes are these notes used to group connected notes. Can be a TOC, a sort description, or whatever you want.


<a id="org37977ef"></a>

## Org-roam-ui

    (use-package org-roam-ui)


<a id="org3a8428c"></a>

## Combining org roam with markdown syntax!     :INACTIVE:

[md-roam](https://github.com/nobiot/md-roam) is a package (not available in melpa or elpa) aims to allow you the use
of markdown file within a org roam database. This feature could help me to
combine some options from [obsidian](https://obsidian.md/) with the flexibility of using org roam in
emacs.

Lost the links

    (use-package md-roam
      :straight (md-roam
                 :type git
                 :host github
                 :repo "nobiot/md-roam")
      :after org-roam
      :config (md-roam-mode 1)
              (setq md-roam-file-extension "md"))


<a id="org21a723c"></a>

# Denote

    (use-package denote
      :after org
      :hook (dired-mode . denote-dired-mode-in-directories)
      :config
      (setq denote-directory org-roam-directory
            denote-file-type "org"
            denote-infer-keywords t
            denote-prompts '(title keywords signature)
            denote-dired-directories (list denote-directory)))


<a id="org45c6bc6"></a>

# End clayemacs

    (provide 'clayemacs)
    ;;; clayemacs.el ends here

