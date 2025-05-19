;;; clay-ui.el -*- lexical-binding: t -*-


(defgroup clay-gui nil
          "Customization group for the interface."
          :group 'clay
          :tag "Clay UI")

(defcustom clay-default-font "FiraCodeNerdFont"
  "Font string for UI fonts."
  :type 'string
  :group 'clay-gui)

(defcustom clay-fixed-font "FiraCodeNerdFont"
  "Font string for fixed pitch modes."
  :type 'string
  :group 'clay-gui)

(defcustom clay-variable-font "Iosevka Aile"
  "Font string for variable pitch texts."
    :type 'string
    :group 'clay-gui)


(defun clay-update-comment-font-face ()
  (if clay-ui-italic-comment-face
    (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
    (set-face-attribute 'font-lock-comment-face nil :slant 'normal)))


(defun clay-update-keyword-font-face ()
  (if clay-ui-italic-comment-face
    (set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
    (set-face-attribute 'font-lock-keyword-face nil :slant 'normal)))


(defcustom clay-ui-italic-comment-face t
           "Non-nil to enable italic face in comments."
           :group 'clay-gui
           :type 'boolean
           :set (lambda (k v)
                  (set-default k v)
                  (clay-update-comment-font-face)))

(defcustom clay-font-lock-italic-keyword-face nil
           "Non-nil to enable italic face in keywords."
           :type 'boolean
           :group 'clay-gui
           :set (lambda (k v)
                  (set-default k v)
                  (clay-update-keyword-font-face)))

(defcustom clay-enable-ligatures nil
           "Non-nil to enable ligatures in prog-mode."
           :type 'boolean
           :group 'clay-gui
           :set (lambda (_ v)
                  (when (fboundp 'global-ligature-mode)
                    (global-ligature-mode v))))


(defcustom clay-alpha-value 90
  "The default value of transparency used for the current frame."
  :set (lambda (k v)
         (set-default k v)
         (when (fboundp 'clay-set-background) (clay-set-background)))
  :group 'lem
  :type '(number))


(defvar clay-ligatures-prog-mode-list
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


;; Install package


(use-package! ligature
  :config
 ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  (ligature-set-ligatures '(prog-mode org-mode) clay-ligatures-prog-mode-list)
 (global-ligature-mode t))

(use-package! nerd-icons :defer t)
(use-package! nerd-icons-dired
    :defer t
    :hook
    (dired-mode . nerd-icons-dired-mode))

(use-package! nerd-icons-completion
    :defer t
    :config
    (nerd-icons-completion-mode))

(use-package! doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (load-theme 'doom-dracula t))

(use-package! mood-line
  :remote t
  :config
  (mood-line-mode)
  :custom
  (mood-line-glyph-alist mood-line-glyphs-fira-code))

(use-package! diminish)

(use-package! minions
  :hook ((doom-modeline-mode mood-line-mode) . minions-mode))

(use-package! paren
  :remote nil
  :config
  (setq show-paren-delay 0.1
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t)
  ;; (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

(defun clay-set-background ( &optional frame)
  "The default value of transparency used for the current FRAME."
  (unless is-termux
    (let ((alpha (if (boundp 'clay-alpha-value) clay-alpha-value 100)))
      (let ((tuple `(,alpha . ,alpha)))
        (set-frame-parameter frame 'alpha tuple)
        (add-to-list 'default-frame-alist `(alpha-background . ,clay-alpha-value))))))


(defun clay-set--fonts ()
  "Function to setup the fonts once the frame is create.
This is required when using the daemon mode"
  (set-face-attribute 'default nil
                      :family clay-default-font
                      :width 'normal
                      :weight 'normal
                      :height 110)
  (set-face-attribute 'fixed-pitch nil
                      :inherit 'default
                      :weight 'medium
                      :height 1.0
                      :family clay-fixed-font)
  (set-face-attribute 'variable-pitch nil
                      :family  clay-variable-font
                      :inherit 'default
                      :weight 'regular)
  (set-face-attribute 'line-number nil
                      :family   clay-fixed-font
                      :inherit 'default
                      :weight  'regular
                      :slant 'normal)
  (set-face-attribute 'line-number-current-line nil
                      :family clay-fixed-font
                      :inherit 'default
                      :weight 'regular
                      :slant 'normal))


(defun clay-set-fonts (frame)
  "Setup fonts for FRAME."
  (select-frame frame)
  (clay-set--fonts))

(defun clay--init-ui ()
  "Initialize Clay UI settings for current session."
  (clay-set--fonts)
  (clay-set-background))

(defun clay--init-ui-for-frame (frame)
  "Initialize Clay UI settings for new daemon FRAME."
  (clay-set-fonts frame)
  (clay-set-background frame))

(if (daemonp)
    (add-hook 'after-make-frame-functions #'clay--init-ui-for-frame)
  (add-hook 'after-init-hook #'clay--init-ui))


(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'conf-mode-hook #'hl-line-mode)

(provide 'clay-ui)
;;; clay-ui.el ends here
