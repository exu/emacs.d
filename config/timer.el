(setq ct (current-time))
(setq st (current-time))

(defun get-time ()
  (message (concat
            "Lib: "
            (number-to-string (float-time
                               (time-subtract (current-time) ct)))
            ", from start: "
            (number-to-string (float-time
                               (time-subtract (current-time) st)))
            ))
  (setq ct (current-time))
  )
