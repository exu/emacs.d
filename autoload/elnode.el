;; (require 'elnode)

;; (defun elnode-org-handler (httpcon)
;;   (elnode-docroot-for "/home/exu/org/work"
;;       with org-file
;;       on httpcon
;;       do (with-current-buffer (find-file-noselect org-file)
;;            (let ((org-html
;;                   ;; This might throw errors so you could condition-case it
;;                   (org-export-as-html 3 nil nil 'string)))
;;              (elnode-send-html httpcon org-html)))))


;;  (elnode-start 'elnode-org-handler :port 8000 :host "10.0.0.89")

;; ;; (require 'elnode)

;; ;; (setq my-webserver
;; ;;       (elnode-webserver-handler-maker "/home/exu/org/work"))

;; ;; (elnode-start my-webserver :port 9099 :host "10.0.0.89")
