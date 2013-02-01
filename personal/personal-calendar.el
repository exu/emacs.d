;;(add-to-list 'load-path "~/.emacs.d/custom/emacs-calfw/")

;;   (require 'calfw)
;;   (require 'calfw-cal)
;;   (require 'calfw-org)
;;   (require 'calfw-ical)
;;
;;   (defun my-open-calendar ()
;;     (interactive)
;;     (cfw:open-calendar-buffer
;;      :contents-sources
;;      (list
;;       (cfw:org-create-source "Green")  ; orgmode source
;;       ;;(cfw:howm-create-source "Blue")  ; howm source
;;       ;;(cfw:cal-create-source "Orange") ; diary source
;;       ;;(cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
;;       (cfw:ical-create-source "gcal" "https://www.google.com/calendar/ical/43uil9p8qe7ubg92o66qg4a39s%40group.calendar.google.com/private-a53a71346d711f65d07ca7ad082afbef/basic.ics" "IndianRed") ; google calendar ICS
;;      )))
;;
;;
;; (cfw:open-ical-calendar "https://www.google.com/calendar/ical/43uil9p8qe7ubg92o66qg4a39s%40group.calendar.google.com/public/basic.ics")
