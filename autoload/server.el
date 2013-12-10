(require 'server)
(unless (server-running-p) (server-mode t))


;; (when (and (daemonp) (locate-library "edit-server"))
;;   (require 'edit-server)
;;   (edit-server-start t))
