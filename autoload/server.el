(if (and (fboundp 'server-running-p)
         (not (server-running-p)))
   (server-mode t))


(server-mode t)
