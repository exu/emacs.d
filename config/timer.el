(setq ct (current-time))

(defun get-time ()
  (message (number-to-string (float-time
                              (time-subtract (current-time) ct))))
  (setq ct (current-time))
  )
