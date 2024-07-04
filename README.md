

# Emacs Config


# Table of Contents     :TOC:


## Startup


### Use *lexical-binding*

Lexical binding is a mode that allows to use special features of the languages. It options tell the configuration that works as a program more than just a simple configuration

This will generate a header at the top of the tangled file to indicate it is generated and is not meant to be modified directly.

    ;;; init.el --- inti file for my custom configuration  -*- lexical-binding: t; -*-


### Early init

The early-init file is loaded before any process of emacs, either the package system. So I will configure the directories used by Emacs to prevent the default behaviour which get dirty the configuration folder.

Package initialize occurs automatically, before user-init-file is loaded, but after early-init-file. We handle package initialization, so we must prevent Emacs from doing it early! I use straight as package manager, so I need to disable the default behavior before the `package.el` is loaded.

    ;; SetupFolder
    (defvar private-emacs-directory nil
    "The folder where the emacs configuration is stored")
    (setq package-enable-at-startup nil
          private-emacs-directory user-emacs-directory
          ;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
          user-emacs-directory (expand-file-name "~/.cache/emacs/")
          url-history-file (expand-file-name "url/history" user-emacs-directory))
    ;; -SetupFolder


### Startup performance

Make startup faster by reducing the frequency of garbage collection and then use
a hook to measure Emacs startup time.

    ;; -SetupFolder
    
    ;; DeferGc
    (setq site-run-file nil                  ; No site-wide run-time initializations.
          inhibit-default-init t             ; No site-wide default library

Also, we can prevent launch the hook associated with some files modification in startup and reenable it after all the process is completed

    gc-cons-percentage 0.2
    native-comp-eln-load-path (list (expand-file-name "eln-cache" user-emacs-directory)))


## Disable unnecessary interfaces

Befaure the windows is created, we can disable some components to prevent it renders

    (defvar file-name-handler-alist-original file-name-handler-alist)
    (setq file-name-handler-alist nil)
    
    (menu-bar-mode -1)


## Garbage collection

At the init-file we modified the garbage collection configuration, we can restore it and track create a profile of the startup process

    ;; BetterGc
    (add-hook 'emacs-startup-hook
      (lambda ()
        (setq gc-cons-threshold (* 2 1024 1024)
              file-name-handler-alist file-name-handler-alist-original)
        (makunbound 'file-name-handler-alist-original)
          (message "*** Emacs loaded in %s seconds with %d garbage collections."


## Load Path

All the configuration files are stored in `modules/` folder, so they need to be added to `load-path` variable

    ;; LoadPath
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
    ;; -LoadPath


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

For package managemnt I combine `se-package` with `straight`. To boot the process, I will disable the checking step that ensure the system has the newest version of each package.

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
    ;; -Straight

