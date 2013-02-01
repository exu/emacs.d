(setq gnus-select-method '(nnimap "edp"
                                  (nnimap-address "mail.edpauto.com")
                                  (nnimap-server-port 143)
                                  (nnimap-stream starttls)))



(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("mail.edpauto.com" 587 nil nil))
      smtpmail-auth-credentials '(("mail.edpauto.com" 587 "jacek.wysocki@edpauto.com" nil))
      smtpmail-default-smtp-server "mail.edpauto.com"
      smtpmail-smtp-server "mail.edpauto.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "jw.vm.edp")

(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
