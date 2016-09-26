(setq gnus-select-method '(nnimap "edp"
                                  (nnimap-address "e-d-p.net")
                                  (nnimap-server-port 143)
                                  (nnimap-stream starttls)))



(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("e-d-p.net" 587 nil nil))
      smtpmail-auth-credentials '(("e-d-p.net" 587 "jacek.wysocki@edpauto.com" nil))
      smtpmail-default-smtp-server "e-d-p.net"
      smtpmail-smtp-server "e-d-p.net"
      smtpmail-smtp-service 587
      smtpmail-local-domain "jw.vm.edp")

(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(setq gnus-posting-styles
      '((".*"
         ("CC" "jacek.wysocki@edpauto.com")
         (address "jacek.wysocki@edpauto.com"))))
