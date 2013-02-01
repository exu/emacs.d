;;;; ORG mode helper
(defun org-open-daily-file ()
  (interactive)
  (let ((daily-name (format-time-string "%Y-%m-%d")))
    (find-file (expand-file-name (concat "~/org/daily/" daily-name ".org")))
    ))

(defun org-open-index-file ()
  (interactive)
  (find-file (expand-file-name "~/org/index.org")))

(defun org-open-work-todo-file ()
  (interactive)
  (find-file (expand-file-name "~/org/work/todo.org")))

(defun org-open-private-todo-file ()
  (interactive)
  (find-file (expand-file-name "~/org/priv/todo.org")))

(defun org-open-journal-file ()
  (interactive)
  (find-file (expand-file-name "~/org/journal.org")))


(defun open-recent-sql-file ()
  (interactive)
  (find-file (expand-file-name "~/Workspace/run.sql")))


(defun open-personal-file-keys () (interactive) (open-personal-file "keys"))
(defun open-personal-file-org () (interactive) (open-personal-file "org"))
(defun open-personal-file-init () (interactive) (open-personal-file "init"))
(defun open-personal-file-functions () (interactive) (open-personal-file "functions"))

(defun open-personal-file (name)
  (interactive)
  (find-file (expand-file-name (concat "~/.emacs.d/personal/personal-" name ".el"))))


(defun open-scratch-buffer ()
  "Switch to the scratch buffer. If the buffer doesn't exist,
create it and write the initial message into it."
  (interactive)
  (let* ((scratch-buffer-name "*scratch*")
         (scratch-buffer (get-buffer scratch-buffer-name)))
    (unless scratch-buffer
      (setq scratch-buffer (get-buffer-create scratch-buffer-name))
      (with-current-buffer scratch-buffer
        (lisp-interaction-mode)
        (insert initial-scratch-message)))
    (switch-to-buffer scratch-buffer)))

;;;; Language switcher
(let
    ((langs '("polish" "francais" "english")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))



;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun semnav-up (arg)
  (interactive "p")
  (when (nth 3 (syntax-ppss))
    (if (> arg 0)
        (progn
          (skip-syntax-forward "^\"")
          (goto-char (1+ (point)))
          (decf arg))
      (skip-syntax-backward "^\"")
      (goto-char (1- (point)))
      (incf arg)))
  (up-list arg))

;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun extend-selection (arg &optional incremental)
  "Select the current word.
Subsequent calls expands the selection to larger semantic unit."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (or (region-active-p)
                         (eq last-command this-command))))
  (if incremental
      (progn
        (semnav-up (- arg))
        (forward-sexp)
        (mark-sexp -1))
    (if (> arg 1)
        (extend-selection (1- arg) t)
      (if (looking-at "\\=\\(\\s_\\|\\sw\\)*\\_>")
          (goto-char (match-end 0))
        (unless (memq (char-before) '(?\) ?\"))
          (forward-sexp)))
      (mark-sexp -1))))

(global-set-key (kbd "M-8") 'extend-selection)

(defun select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
Delimiters are paired characters:
 () [] {} «» ‹› “” 〖〗 【】 「」 『』 （） 〈〉 《》 〔〕 ⦗⦘ 〘〙

For practical purposes, it also includes double straight quote
\", but not curly single quote matching pairs ‘’, because that is
often used as apostrophy. It also consider both left and right
angle brackets <> as either beginning or ending pair, so that it
is easy to get content inside html tags."
  (interactive)
  (let (b1 b2)
    (skip-chars-backward "^<>([{“「『‹«（〈《〔【〖⦗〘\"")
    (setq b1 (point))
    (skip-chars-forward "^<>)]}”」』›»）〉》〕】〗⦘〙\"")
    (setq b2 (point))
    (set-mark b1)
    )
  )

(defun cowsay-on-region ()
  "Cow power! `cowsay'"
  (interactive)
  (shell-command-on-region
   ;; beginning and end of buffer
   (region-beginning)
   (region-end)
   ;;(point-min)
   ;;(point-max)
   ;; command and parameters
   "cowsay"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Cowsay Error*"
   ;; show error buffer?
   t))

(global-set-key (kbd "C-=") 'cowsay-on-region)



(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(defun backward-up-sexp (arg)
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp)


(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
      loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'joc-dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'joc-dired-single-buffer-mouse)
  (define-key dired-mode-map [backspace]
    (function
     (lambda nil (interactive) (joc-dired-single-buffer ".."))))
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (joc-dired-single-buffer "..")))))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

;;(setq tempStr (replace-regexp-in-string "^0x" "" inputStr ))

;;
;; (defun hex2ascii (x)
;;   ;;(setq ts "47")

;;   (setq ts (replace-regexp-in-string "^0x" "" x ))
;;   (char-to-string (string-to-number ts 16))
;;   )

;;(hex2ascii "0x47")


;; Commenting done right!
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
   If no region is selected and current line is not blank and we
   are not at the end of the line, then comment current line.
   Replaces default behaviour of comment-dwim, when it inserts
   comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))



(defun selective-display-toggle ()
  (interactive)
  (if selective-display
      (progn (message "Show all") (setq selective-display nil))
    (progn (message "Show functions") (setq selective-display 8) (sit-for 0) (next-line) (previous-line))
    ))





(defun get-string-from-file (filePath)
  "Return FILEPATH's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))



(defun my-switch-to-url-buffer (status)
  "Switch to the buffer returned by `url-retreive'.
     The buffer contains the raw HTTP response sent by the server."
  (message (buffer-string))
  ;;(switch-to-buffer (current-buffer))
  )


;; (defun redmine-today-hours ()
;;   (interactive)
;;    (let (json (shell-command "php /usr/scripts/redmine.php 'jacek.wysocki' json")))
;;    (message 'json)
;;    (json-read-from-string 'json)
;;   )
;;
;; (redmine-today-hours)
;;
;;(url-retrieve "http://xtest.e-d-p.net/xml/RM.TimeByPeople.xml" 'my-switch-to-url-buffer)


(defun convert-time-to-float ()
  (interactive)
  (setq sel (buffer-substring
             (region-beginning)
             (region-end)
             ))

  (message sel)

  (setq lista (split-string sel ":"))

  (setq first-element (car lista))
  (setq second-element (car (cdr lista)))

  (delete-region (region-beginning)
                 (region-end))

  (insert (format "%f" (+ (string-to-number first-element) (/ (string-to-number second-element) (float 60)))))
  )

;;; 12:36

;prelude based
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))


;; prelude based
(defun ido-goto-symbol (&optional symbol-list)
    "Refresh imenu and jump to a place in the buffer using Ido."
    (interactive)
    (unless (featurep 'imenu)
      (require 'imenu nil t))
    (cond
     ((not symbol-list)
      (let ((ido-mode ido-mode)
            (ido-enable-flex-matching
             (if (boundp 'ido-enable-flex-matching)
                 ido-enable-flex-matching t))
            name-and-pos symbol-names position)
        (unless ido-mode
          (ido-mode 1)
          (setq ido-enable-flex-matching t))
        (while (progn
                 (imenu--cleanup)
                 (setq imenu--index-alist nil)
                 (prelude-ido-goto-symbol (imenu--make-index-alist))
                 (setq selected-symbol
                       (ido-completing-read "Symbol? " symbol-names))
                 (string= (car imenu--rescan-item) selected-symbol)))
        (unless (and (boundp 'mark-active) mark-active)
          (push-mark nil t nil))
        (setq position (cdr (assoc selected-symbol name-and-pos)))
        (cond
         ((overlayp position)
          (goto-char (overlay-start position)))
         (t
          (goto-char position)))))
     ((listp symbol-list)
      (dolist (symbol symbol-list)
        (let (name position)
          (cond
           ((and (listp symbol) (imenu--subalist-p symbol))
            (prelude-ido-goto-symbol symbol))
           ((listp symbol)
            (setq name (car symbol))
            (setq position (cdr symbol)))
           ((stringp symbol)
            (setq name symbol)
            (setq position
                  (get-text-property 1 'org-imenu-marker symbol))))
          (unless (or (null position) (null name)
                      (string= (car imenu--rescan-item) name))
            (add-to-list 'symbol-names name)
            (add-to-list 'name-and-pos (cons name position))))))))


(defun get-file-in-other-project (from to)
  (interactive)
  (message (concat from to))
  (find-file (expand-file-name (replace-regexp-in-string from to buffer-file-name)))
  )

(defun kg-to-rk ()
  (interactive)
  (get-file-in-other-project "kasia-gotuje" "kasia-retro")
  )

;; prelude-ido-goto-symbol
(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names (substring-no-properties name))
          (add-to-list 'name-and-pos (cons (substring-no-properties name) position))))))))


(defun send-to-redmine () 
  (interactive)
  (if (string= "DONE" (format "%s" (nth 2 (org-heading-components))))
      (progn
        (setq redmine-command-path "/home/exu/Workspace/poligon/js/redmine/redmine_timeentry.js")
        (setq date (substring (org-entry-get (point) "CLOSED") 0 10 ))
        (if date
            (setq date-param (concat " -d " date))
          (setq date-param "")
          )
        (setq command (format "node %s %s -i '%s' -h '%f' %s"
                              redmine-command-path
                              date-param
                              (car (org-get-tags-at))
                              (/ (org-clock-sum-current-item) 60.0)
                              (nth 4 (org-heading-components))))
        (message command)
        (setq shell-result (number-to-string(string-to-number (shell-command-to-string command))))
        (message shell-result)
        (org-set-property "redmine-timeentry-id" shell-result)
        )
        
    (progn
      (message "Switch task to DONE")
      (ding))
    ))

