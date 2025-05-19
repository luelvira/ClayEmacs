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

(defconst is-work
          (or
  	        (string= (system-name) "baco.diatel.upm.es")
	        (string= (system-name) "fedora"))
          "Boolean variable to determinate if Emacs is runing on laptop's working machine.")


(provide 'clay-system)
