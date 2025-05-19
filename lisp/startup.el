
(require 'server)
(unless (or is-termux
            (server-running-p))
  (server-start))

(provide 'startup)
