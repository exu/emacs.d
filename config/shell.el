(require 'ansi-color)
(defadvice display-message-or-buffer (before ansi-color activate)
  "Process ANSI color codes in shell output."
  (let ((buf (ad-get-arg 0)))
    (message (concat "Coloring " (buffer-name buf)))
    (and (bufferp buf)
         (or
          (string= (buffer-name buf) "*Shell Command Output*")
          (string= (buffer-name buf) "*compilation*")
          (string= (buffer-name buf) "*go-koans*"))
         (with-current-buffer buf
           (ansi-color-apply-on-region (point-min) (point-max))))
    ))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


 (setq eshell-prompt-function (lambda nil "$ "))
