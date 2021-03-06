(setq ct (current-time))
(setq st (current-time))

(defun get-time (what)
  (message (concat
            what ": "
            (number-to-string (float-time
                               (time-subtract (current-time) ct)))
            "s, from start: "
            (number-to-string (float-time
                               (time-subtract (current-time) st)))
	    "s"
            ))
  (setq ct (current-time))
  )


(defun timed-load (what)
  (load what)
  (get-time what)
  )



;RG mode helper
(defun org-open-daily-file ()
  (interactive)
  (let ((daily-name (format-time-string "%Y-%m-%d")))
    (find-file (expand-file-name (concat "~/org/daily/" daily-name ".org")))
    ))

(defun org-capture-default-work-todo ()
  (interactive)
  (org-capture nil "d"))

(defun org-open-index-file ()
  (interactive)
  (find-file (expand-file-name "~/org/index.org")))

(defun org-open-work-wiki-index-file ()
  (interactive)
  (find-file (expand-file-name "~/org/wiki.org")))

(defun org-open-architecture-file ()
  (interactive)
  (find-file (expand-file-name "~/org/wiki/architecture.org")))

(defun org-open-current-work-file ()
  (interactive)
  (find-file (expand-file-name "~/org/wiki/architecture.org")))

(defun org-open-home-todo-file ()
  (interactive)
  (find-file (expand-file-name "~/org/todo.org")))

(defun org-open-work-todo-file ()
  (interactive)
  (find-file (expand-file-name "~/org/work.org")))


(defun org-open-english-file ()
  (interactive)
  (find-file (expand-file-name "~/org/wiki/english.org")))

(defun org-open-presentations-file ()
  (interactive)
  (find-file (expand-file-name "~/org/wiki/presentation.org")))


(defun org-open-journal-file ()
  (interactive)
  (find-file (expand-file-name "~/org/journal.org")))

(defun org-new-date-header ()
  (interactive)
  (goto-char (point-max))
  (insert (concat "\n\n* " (format-time-string "%Y-%m-%d") "\n\n"))
  (org-new-redmine-task))

(setq redmine-ids '("5353" "7933" "7934" "7935"))

(defun org-new-redmine-task ()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "** TODO ")
  (org-set-tags-to
   (ido-completing-read "Choose a Redmine ID: " redmine-ids  nil t))
  (insert " ")
  (org-clock-in)
  )

(defun org-refile-to-today ()
  (interactive)
  (org-refile nil (buffer-name) (list (concat "* " (format-time-string "%Y-%m-%d")) (buffer-file-name) nil nil)))


(defun open-recent-sql-file ()
  (interactive)
  (find-file (expand-file-name "~/workspace/run.sql")))


(defun open-config-file-keys () (interactive) (open-config-file "keys"))
(defun open-config-file-projects () (interactive) (open-config-file "projects"))
(defun open-config-file-org () (interactive) (open-config-file "org"))
(defun open-config-file-init () (interactive) (find-file (expand-file-name (concat "~/.emacs.d/init.el"))))
(defun open-config-file-modes () (interactive) (open-config-file "modes"))
(defun open-config-file-common () (interactive) (open-config-file "common"))
(defun open-config-file-functions () (interactive) (open-config-file "functions"))
(defun open-config-file-hooks () (interactive) (open-config-file "hooks"))

(defun open-config-file (name)
  "Opening custom config file be its name without extension"
  (interactive)
  (find-file (expand-file-name (concat "~/.emacs.d/config/" name ".el"))))

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

;;; Language switcher
(let
    ((langs '("polish" "francais" "english")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

;;; Theme switcher

(let
    ((themes '(zenburn adwaita solarized-light solarized-dark)))
  (setq theme-ring (make-ring (length themes)))
  (dolist (elem themes) (ring-insert theme-ring elem)))

(defun cycle-themes ()
  (interactive)
  (let ((theme (ring-ref theme-ring -1)))
    (ring-insert theme-ring theme)
    (load-theme theme)))


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

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


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
        (setq redmine-command-path "/home/exu/www/poligon/js/redmine/redmine_timeentry.js")
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


(defun diff-buffer-with-current-file () (interactive) (diff-buffer-with-file (buffer-name)))

;; prelude based code
(defun visit-term-buffer ()
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(defun byte-recompile-emacs-directory ()
  (interactive)
  (byte-recompile-directory "~/.emacs.d/config" 0 1)
  (byte-recompile-directory "~/.emacs.d/snippets" 0 1)
  (byte-recompile-directory "~/.emacs.d/vendor" 0 1)
  (byte-recompile-directory "~/.emacs.d/elpa" 0 1)
  )

(defun run-erc-process ()
  "Runs ERC process"
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "ex00"))

(defun php-correct-array ()
  (interactive)
  (query-replace "->" "->\n")
  )

(defun camel-case-to-underscores (start end)
  "Convert any string matching something like aBc to a_bc"
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char 1)
    (let ((case-fold-search nil))
      (while (search-forward-regexp "\\([a-z]\\)\\([A-Z]\\)\\([a-z]\\)" nil t)
        (replace-match (concat (match-string 1)
                               "_"
                               (downcase (match-string 2))
                               (match-string 3))
                       t nil)))))


(defun underscores-to-camel-case (start end)
  "Convert any string matching something like a_bc to aBc"
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char 1)
    (let ((case-fold-search nil))
      (while (search-forward-regexp "\\(\\w\\)_\\(\\w\\)" nil t)
        (replace-match (concat (match-string 1)
                               (upcase (match-string 2)))
                       t nil)))))

(defun camelcase-to-underscore-string (s &optional sep start)
  "Convert any string matching something like aBc to a_bc"
  (let ((case-fold-search nil))
    (while (string-match "[A-Z]" s (or start 1))
      (setq s (replace-match (concat (or sep "_")
                                     (downcase (match-string 0 s)))
                             t nil s)))
    (downcase s)))

(defun underscore-to-camelcase-string (s &optional sep start)
  "Convert any string matching something like a_bc to aBc"
  (let ((case-fold-search nil))
    (while (string-match "\\(\\w\\)_\\(\\w\\)" s (or start 1))
      (setq s (replace-match (concat (match-string 1 s)
                               (upcase (match-string 2 s)))
                       t nil s)))
    s))



(defun php-correct-parenthesis ()
  "Inserts space before parenthesis"
  (interactive)
  (setq saved-point (point))
  (move-beginning-of-line 1)
  (search-forward-regexp "\\(\(\\)" nil t)
  (backward-char)
  (insert " ")
  (goto-char (+ saved-point 1))
  )

(defun kill-line-and-one-space ()
  "Inserts space before parenthesis"
  (interactive)
  (setq saved-point (point))
  (move-end-of-line 1)
  (kill-line)
  (just-one-space)
  (goto-char (+ saved-point 1))
  )

(defun indent-function ()
  "Indents function body where cursor is on"
  (interactive)
  (setq saved-point (point))
  (mark-defun)
  (indent-region (region-beginning) (region-end))
  (goto-char saved-point)
  )

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (delete-other-windows)
    (message "Killing all other buffers")
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))


(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard.
   From prelude package"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))



(defun geben-find-current-file ()
  "Loads current file in geben debug mode"
  (interactive)

  (geben-with-current-session session


        (let ((filename (if (equal major-mode 'dired-mode)
                            default-directory
                          (buffer-file-name))))
          (when filename
            (geben-open-file (geben-source-fileuri session filename))
            (message (concat "File " filename " loaded"))
            ))))



(defun php-symfony2-generate-namespace ()
  "Write current file namespace"
  (interactive)
  (buffer-file-name)
  (setq namespace
        (replace-regexp-in-string "\/$" ""
          (car (cdr (split-string (file-name-directory (or load-file-name buffer-file-name)) "/src/")))))

  (insert (concat "namespace " (replace-regexp-in-string "\/" "\\\\" namespace) ";\n"))
  )

(defun insert-datetime ()
  "Inserts ISO datetime"
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S"))
  )




(defun utest ()
  (interactive)
  (call-interactively (google-translate-at-point 1))
  )


(defun org-publish-blog ()
  (interactive)
  (org-publish "github")
  )

(defun org-publish-wiki ()
  (interactive)
  (ignore-errors
    (org-publish "wiki-static")
    (org-publish "wiki")
    (org-wiki-deploy)
    )
  )

(defun org-wiki-deploy ()
  (interactive)
  (shell-command "scp -r \"/home/exu/www/html/wiki\" w:/home/jacek.wysocki/" "* scp *" "* Errors *")
  )


(defun enlarge-vertical ()
  (interactive)
  (enlarge-window 10)
  )

(defun shrink-vertical ()
  (interactive)
  (enlarge-window -10)
  )

(defun enlarge-horizontal ()
  (interactive)
  (enlarge-window-horizontally 10)
  )

(defun shrink-horizontal ()
  (interactive)
  (enlarge-window-horizontally -10)
  )

(defun two-third-window-width ()
  "enlarge|shrink current window to use 2/3 of emacs width."
  (interactive)
  (setq new-delta (- (* (/ (frame-width) 3) 2) (window-width)))
  (enlarge-window-horizontally new-delta)
  )

(defun other-window-and-enlarge-two-third ()
  "Goto other window"
  (interactive)
  (other-window 1)
  (two-third-window-width)
  )


;; moving quickly
(defun next-5-lines ()
  (interactive)
  (ignore-errors (next-line 5))
  )

(defun previous-5-lines ()
  (interactive)
  (ignore-errors (previous-line 5)))

(defun forward-5-chars ()
  (interactive)
  (ignore-errors (forward-char 5))
  )

(defun backward-5-chars ()
  (interactive)
  (ignore-errors (backward-char 5))
  )


(defun word-at-point ()
  "Get word at point in original buffer"
  (interactive)
  (let (word beg)
    (with-current-buffer (window-buffer (minibuffer-selected-window))
      (save-excursion
        (skip-syntax-backward "w_")
        (setq beg (point))
        (skip-syntax-forward "w_")
        (setq word (buffer-substring-no-properties beg (point)))))
    ))

(defun word-at-point-translate-from-en-to-pl ()
  "Translates english word at point to polish"
  (interactive)
  (setq word (word-at-point))
  (open-google-translate word "en/pl")
  )

(defun word-at-point-translate-from-pl-to-en ()
  "Translates polish word at point to english"
  (interactive)
  (setq word (word-at-point))
  (open-google-translate word "pl/en")
  )

;; New way of opening google translate site
(defun open-translate-site (query-string)
  "Open browser with google translate"
  (interactive "sEnter string to translate: " )
  (setq directions (list "en/pl" "pl/en"))
  (setq direction (ido-completing-read "Dirtection: " directions))
  (open-google-translate query-string direction)
  )

(defun open-google-translate (query-string direction)
  (setq url (concat "http://translate.google.pl/#" direction  "/" query-string))
  (message (concat "Going to: " url))
  (browse-url url)
  )



;; http://emacsredux.com/
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0))))
  )

;; http://emacsredux.com/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun exu-org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))


(defun notify-send (title msg &optional icon sound)
  "Show a popup if we're on X, or echo it otherwise"
  (interactive)
  (when sound (shell-command-to-string
                (concat "paplay " sound " 2> /dev/null &")))
  (if (eq window-system 'x)
      (shell-command-to-string (concat "notify-send " (if icon (concat "-i " icon) "")
                             " '" title "' '" msg "' &"))
    (message (concat title ": " msg))))

(defun exu-appt-display (min-to-app new-time msg)
  (notify-send (format "Appointment in %s minute(s)" min-to-app) msg
              "/usr/share/icons/gnome/32x32/status/appointment-soon.png"
              "/usr/share/sounds/ubuntu/stereo/phone-incoming-call.ogg"))

(defun php-toggle-test-src ()
  (interactive)
  (setf file-path (buffer-file-name))
  (message file-path)
  (find-file
   (if (string-match-p (regexp-quote "Test.php") file-path)
       (progn
         (message "Switching to Source")
         (setf file (mapconcat 'identity (split-string file-path "/Tests") ""))
         (replace-regexp-in-string "Test\\.php$" ".php" file)
         )
     (progn
       (message "Switching to Test")

       (setf case-fold-search-value case-fold-search)
       (setq case-fold-search nil)

       (if (string-match-p (regexp-quote "Bundle\/") file-path)
           (setf path-explode-regexp "Bundle\/")
         (setf path-explode-regexp "Extension\/"))

       (setf file-tmp (mapconcat 'identity (split-string file-path path-explode-regexp) (concat (match-string 0 file-path) "Tests/") ))
       (setq case-fold-search case-fold-search-value)
       (setf file (concat (file-name-sans-extension file-tmp) "Test.php")))
     )))

(defun go-toggle-spec-src ()
  (interactive)
  (setf file-path (buffer-file-name))
  (message file-path)
  (find-file
   (if (string-match-p (regexp-quote "_test.go") file-path)
       (progn
         (message "Switching to Source")
         (setf file (replace-regexp-in-string "_test\\.go" ".go" file-path))
         )
     (progn
       (message "Switching to Spec")
       (setf file (replace-regexp-in-string "\\.go$" "_test.go" file-path))
     ))))

(defun js-toggle-test-src ()
  "File switcher for Mocha tests"
  (interactive)
  (setf file-path (buffer-file-name))
  (message file-path)
  (find-file
   (if (string-match-p (regexp-quote "/test/") file-path)
       (progn
         (message "Switching to Source")
         (replace-regexp-in-string "\\/test\\/" "/lib/" file-path)
         )
     (progn
       (message "Switching to Spec")
       (replace-regexp-in-string "/lib/" "/test/" file-path)
     ))))

(defun js-toggle-spec-src ()
  (interactive)
  (setf file-path (buffer-file-name))
  (message file-path)
  (find-file
   (if (string-match-p (regexp-quote "spec.js") file-path)
       (progn
         (message "Switching to Source")
         (setf file (replace-regexp-in-string "/test/spec/" "/app/scripts/" file-path))
         (replace-regexp-in-string "\\.spec\\.js$" ".js" file)
         )
     (progn
       (message "Switching to Spec")
       (setf file (replace-regexp-in-string "/app/scripts/" "/test/spec/" file-path))
       (replace-regexp-in-string "\\.js$" ".spec.js" file)
     ))))


(defun js-jshint-fix ()
  (interactive)
  (setq saved-point (point))
  ;; function arguments $aaa=1 --> $aaa = 1
  ;; (in elisp regexp there is no \w :) use [[:word:]] instead)
  (replace-regexp "\\(\\$[[:word:]]+_?[[:word:]]*_?[[:word:]]*\\)=\\([^ ^,^\\^=^>]\\)" "\\1 = \\2" nil (point-min) (point-max))
  ;; func args 1,1 --> 1, 1
  (replace-regexp "\\(\s?\\),\\(\\$[^,^\\)]+\\)" ", \\2" nil (point-min) (point-max))

  ;; control expressions
  (replace-regexp "^\\(\s*\\)\\(if\\|for\\|foreach\\|while\\|switch\\|catch\\)\s*\\([^{]+\\)\n\s*{" "\\1\\2 \\3 {" nil (point-min) (point-max))
  (replace-string "if(" "if (" nil (point-min) (point-max))
  (replace-string "foreach(" "foreach (" nil (point-min) (point-max))

  ;; parenthesis and mustaches
  (replace-string "){" ") {" nil (point-min) (point-max))
  (replace-string "( " "(" nil (point-min) (point-max))
  (replace-regexp "\\([^\s]\\)\s)" "\\1)" nil (point-min) (point-max))
  (replace-string ") )" "))" nil (point-min) (point-max))
  (replace-string ") ) )" ")))" nil (point-min) (point-max))

  ;; closures
  (replace-string "function(" "function (" nil (point-min) (point-max))
  ;; big fat true false and null
  (replace-string "TRUE" "true" nil (point-min) (point-max))
  (replace-string "FALSE" "false" nil (point-min) (point-max))
  (replace-string "NULL" "null" nil (point-min) (point-max))
  (replace-string "\"" "'" nil (point-min) (point-max))
  (replace-string " else if " " elseif " nil (point-min) (point-max))

  ;; going back where we start (~)
  (goto-char saved-point))



(defun php-toggle-spec-src ()
  (interactive)
  (setf file-path (buffer-file-name))
  (message file-path)
  (find-file
   (if (string-match-p (regexp-quote "Spec.php") file-path)
       (progn
         (message "Switching to Source")
         (setf file (replace-regexp-in-string "/spec/" "/src/" file-path))
         (replace-regexp-in-string "Spec\\.php$" ".php" file)
         )
     (progn
       (message "Switching to Spec")
       (setf file (replace-regexp-in-string "/src/" "/spec/" file-path))
       (replace-regexp-in-string "\\.php" "Spec.php" file)
     ))))

(defun php-run-spec ()
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (switch-window)
  (eshell)
  (insert (concat "cd " (projectile-project-root)))
  (eshell-send-input)
  (insert "bin/phpspec run --format=pretty")
  (eshell-send-input)
  (switch-window)
  )

(defun php-run-unit ()
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (switch-window)
  (eshell)
  (insert (concat "cd " (projectile-project-root)))
  (eshell-send-input)
  (insert "bin/phpunit")
  (eshell-send-input)
  (switch-window)
  )

(defun php-symfony2-clear-cache ()
  (interactive)
  (eshell)
  (insert (concat "cd " (projectile-project-root)))
  (eshell-send-input)
  (insert "php app/console cache:clear --no-warmup")
  (eshell-send-input)
  (insert "php app/console cache:clear --env=prod --no-warmup;")
  (eshell-send-input)
  (insert "php app/console cache:clear --env=test --no-warmup;")
  (eshell-send-input)
  (previous-buffer)
  )

(defun php-run-cs-fixer-on-file ()
  (interactive)
  (save-buffer)
  (setq command (format "php-cs-fixer fix '%s' --level=all" (buffer-file-name)))
  (message command)
  (setq shell-result (shell-command command "* php-cs-fixer *" "* Errors *"))
  (message (number-to-string shell-result))
  (revert-buffer))

(defun php-psr2-fix ()
  (interactive)
  (setq saved-point (point))
  ;; function arguments $aaa=1 --> $aaa = 1
  ;; (in elisp regexp there is no \w :) use [[:word:]] instead)
  (replace-regexp "\\(\\$[[:word:]]+_?[[:word:]]*_?[[:word:]]*\\)=\\([^ ^,^\\^=^>]\\)" "\\1 = \\2" nil (point-min) (point-max))
  ;; func args 1,1 --> 1, 1
  (replace-regexp "\\(\s?\\),\\(\\$[^,^\\)]+\\)" ", \\2" nil (point-min) (point-max))
  ;; arrays ''=>'' --> '' => ''
  (replace-regexp "\\([^\s]\\)\\(=>\\)" "\\1 =>" nil (point-min) (point-max))
  (replace-regexp "\\(=>\\)\\([^\s]\\)" "=> \\2" nil (point-min) (point-max))

  ;; functions with { in the same line as declaration
  (replace-regexp "^    \\([a-z\s]*\\)function\s*\\(.*\\)\s*{" "    \\1function \\2\n    {" nil (point-min) (point-max))
  ;; classes with { in the same line as declaration
  (replace-regexp "class\\(.*\\)\s*{" "class\\1\n{" nil (point-min) (point-max))
  ;; control expressions
  (replace-regexp "^\\(\s*\\)\\(if\\|for\\|foreach\\|while\\|switch\\)\s*\\([^{]+\\)\n\s*{" "\\1\\2 \\3 {" nil (point-min) (point-max))
  (replace-string "if(" "if (" nil (point-min) (point-max))
  (replace-string "for(" "for (" nil (point-min) (point-max))
  (replace-string "while(" "while (" nil (point-min) (point-max))
  (replace-string "foreach(" "foreach (" nil (point-min) (point-max))

  ;; parenthesis and mustaches
  (replace-string "){" ") {" nil (point-min) (point-max))
  (replace-string "( " "(" nil (point-min) (point-max))
  (replace-regexp "\\([^\s]\\)\s)" "\\1)" nil (point-min) (point-max))
  (replace-string ") )" "))" nil (point-min) (point-max))
  (replace-string ") ) )" ")))" nil (point-min) (point-max))
  (replace-string "',array" "', array" nil (point-min) (point-max))
  (replace-string "',$" "', $" nil (point-min) (point-max))

  ;; closures
  (replace-string "function(" "function (" nil (point-min) (point-max))
  ;; big fat true false and null
  (replace-string "TRUE" "true" nil (point-min) (point-max))
  (replace-string "FALSE" "false" nil (point-min) (point-max))
  (replace-string "NULL" "null" nil (point-min) (point-max))
  (replace-string " else if " " elseif " nil (point-min) (point-max))

  ;; going back where we start (~)
  (goto-char saved-point))

(defun php-regenerate-tags ()
  (interactive)
  (message "Regenerating TAGS file")
  (projectile-regenerate-tags))

(defun ucfirst (text)
  (if (not (string= "" text))
      (concat (capitalize (substring text 0 1)) (substring text 1))
    ""
    ))

(defun php-rgrep-without-vendor (regexp)
  (interactive "sWrite your regexp: ")
  (add-to-list 'grep-find-ignored-directories "vendor")
  ;; (setq regexp "Inflect")
  (rgrep regexp "*.php" "./src" nil)
  (delete "vendor" grep-find-ignored-directories)
  )


(defun php-symfony2-use ()
  (interactive)
  (setq current-file-directory (file-name-directory (or load-file-name buffer-file-name)))
  (setq src-directory (concat (car (split-string current-file-directory "/src/")) "/src"))
  (setq output (split-string (shell-command-to-string (concat "egrep --color=never -r '^namespace.*;$' " src-directory)) "\n"))
  (setq selected-namespace
        (ido-completing-read "Select class to use: "
                             (mapcar (lambda (in)
                                       (setq class-file (replace-regexp-in-string "/" "\\\\" (car (split-string in ":"))))
                                       (setq class-file (replace-regexp-in-string "\.php$" "" class-file))
                                       (if
                                           (< (length src-directory) (length class-file))
                                           (substring class-file (+ (length src-directory) 1))
                                         ""
                                         )
                                       )
                                     output
                                     )
                             )
        )
  (insert (concat "use " selected-namespace ";"))
  )

(defun php-switch-to-web-mode ()
  (interactive)
  (if (string= (format "%s" major-mode) "web-mode") (php-mode) (web-mode)))


(defun open-file-in-impatience-mode ()
  (interactive)
  (httpd-stop)
  (httpd-start)
  (impatient-mode)
  (browse-url (concat "http://localhost:8080/imp/live/" (file-name-nondirectory (buffer-file-name)) "/"))
  )

(defun open-file-in-browser ()
  (interactive)
  (browse-url (concat "file://" (buffer-file-name)))
  )

(defun open-statics-file-in-browser ()
  (interactive)
  (setq file (car (cdr (split-string (buffer-file-name) "/www/"))))
  (browse-url (concat "http://s.local/" file))
  )

(defun org-export-uml-and-open ()
  (interactive)
  (setq saved-point (point))
  (save-buffer)
  (org-ctrl-c-ctrl-c)
  (org-next-link)
  (org-open-at-point)
  (goto-char saved-point)
  )

(defun org-export-md-update-images-path ()
  (interactive)
  (save-buffer)
  (setq img-path (car (cdr (assoc 'md-img (org-export--list-bound-variables)))))
  (message (concat "Changing remote image path: " img-path))
  ;; (org-export-as 'md)
  (find-file  (replace-regexp-in-string "\\.org" ".md" (buffer-file-name)))
  (beginning-of-buffer)
  (setq img (org-export--list-bound-variables))
  (while (search-forward "](" nil t) (replace-match (concat "](" img-path) nil t))
  (save-buffer)
  (previous-buffer)
  )


(defun uniquify-region-lines (beg end)
  "Remove duplicate adjacent lines in region."
  (interactive "*r")
  (save-excursion
    (goto-char beg)
    (while (re-search-forward "^\\(.*\n\\)\\1+" end t)
      (replace-match "\\1"))))

(defun uniquify-buffer-lines ()
  "Remove duplicate adjacent lines in the current buffer."
  (interactive)
  (uniquify-region-lines (point-min) (point-max)))


(defun org-regenerate-index-file ()
  (interactive)
  (setq command "cd ~/org/; php index.php > index.org;")
  (setq shell-result (shell-command command "* org-index-generator *" "* Errors *"))
  )


(defun gitlab-merge-request ()
  (interactive)
  (setq user "jacek.wysocki")
  (setq output (replace-regexp-in-string "\.git \(fetch)" "" (car (split-string (shell-command-to-string "git remote -v") "\n"))))
  (setq branch-name (car (split-string (shell-command-to-string "git rev-parse --abbrev-ref HEAD") "\n")))
  (setq project-name (car(cdr (split-string output "/"))))
  (setq title (url-hexify-string (replace-regexp-in-string "\n" "" (shell-command-to-string "git log --oneline -1 |cut -c9-"))))
  (setq url (concat "http://foundry.e-d-p.net/" user "/" project-name "/merge_requests/new?merge_request[source_branch]=" branch-name "&merge_request[target_branch]=" branch-name "&merge_request[title]=" title))
  (browse-url url)
  )

(defun md5-region ()
  (interactive)
  (setq selection (buffer-substring (region-beginning) (region-end)))
  (delete-region (region-beginning) (region-end))
  (insert (secure-hash 'md5 selection))
  )


(defun highlight-symbol-on-click (πclick)
  "Mouse click to `describe-char' at clicked point."
  (interactive "e")
  (let ((p1 (posn-point (event-start πclick))))
    (goto-char p1)
    ;; (describe-char p1)
    (highlight-symbol-at-point)
    ))


(defun run-make ()
  (interactive)
  (compile "make"))


(defun run-python-koans ()
  (interactive)
  (save-buffer)
  (setq command "cd ~/workspace/poligon/python/python_koans/python2/; unset LS_COLORS; export TERM=xterm; python2 contemplate_koans.py")
  (setq part (shell-command-to-string command))

  (string-match "^.*Error: \\(.*\\)$" part)
  (setq error (match-string 0 part))
  (setq error (replace-regexp-in-string "\\[[0-9]+m" "" error))
  (message error)

  (string-match "File .?\\(/.*/koans/.*\\.py\\).*line \\([0-9]+\\)" part)
  (setq file (match-string 1 part))
  (setq file (replace-regexp-in-string "\\[[0-9]+m" "" file))

  (string-match "line \\([0-9]+\\)" part)
  (setq line (string-to-number(match-string 1 part)))

  (find-file file)
  (goto-line line)
  (search-forward "(")
  )

(defun search-string-in-project-dir (search)
  "Search string in project dir, using AG (the siver searcher)"
  (interactive "sSearch: ")
  (ag search project-directory)
)



(defun phpdoc ()
  "print-the-php-documentor-block"
  (interactive)
  (search-backward " function")
  (setq method-name (phpdoc-get-method-description))
  (setq params (phpdoc-get-params))
  (phpdoc-block-position)
  (setq inicio (point))
  (setq init-block-point (point))
  (phpdoc-start-line)
  (phpdoc-new-line method-name)
  (phpdoc-new-line)
  (phpdoc-insert-params params)
  (phpdoc-end-line)
  (indent-region inicio (point))
  (goto-char init-block-point)
  (message "PHPDocumentor block created")
)


(defun php-create-setter ()
  "create-the-setter-for-a-variable"
  (interactive)
  (search-backward "$")
  (setq method-name (phpdoc-get-method-description))
  (setq params (phpdoc-get-params))
  (phpdoc-block-position)
  (setq inicio (point))
  (setq init-block-point (point))
  (phpdoc-start-line)
  (phpdoc-new-line method-name)
  (phpdoc-new-line)
  (phpdoc-insert-params params)
  (phpdoc-end-line)
  (indent-region inicio (point))
  (goto-char init-block-point)
  (message "PHPDocumentor block created")
)


(defun phpdoc-block-position ()
  (previous-line)(beginning-of-line)(newline)
)

(defun phpdoc-new-line (&optional phpdoc-data)
  (newline)
  (insert (concat "* " phpdoc-data))
)

(defun phpdoc-end-line ()
  (newline)
  (insert "*/")
)

(defun phpdoc-start-line ()
    (insert "/**")
)

(defun phpdoc-get-method-description ()
  (right-word)
  (search-forward " ")
  (setq init-word (point))
  (right-word)
  (buffer-substring-no-properties init-word (point))
)

(defun phpdoc-get-variable-name ()
  (search-forward " ")
  (setq init-word (point))
  (right-word)
  (buffer-substring-no-properties init-word (point))
)


(defun phpdoc-insert-params (param-list)
  (if (> (length param-list) 0)
  (while param-list
    (phpdoc-new-line (concat "@param " (car param-list)))
    (setq param-list (cdr param-list))
   )
  )
)

(defun phpdoc-get-params ()
  (search-forward "(")
  (setq init-word (point))
  (search-forward ")")
  (setq params (buffer-substring-no-properties init-word (point)))
  (replace-regexp-in-string " " "" (replace-regexp-in-string ")" "" (replace-regexp-in-string "$+" "" params)))
  (setq param-list (split-string (replace-regexp-in-string " " "" (replace-regexp-in-string ")" "" params)) ","))
)

(fset 'php-create-setter
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 115 97 backspace 101 97 114 tab 98 97 tab return 36 return right 67108896 C-right 134217847 134217790 134217848 115 101 97 114 tab 98 97 tab return 125 return return up return tab 112 117 98 99 108 105 backspace backspace backspace 108 105 99 32 102 117 110 99 105 backspace backspace 99 116 105 111 110 32 115 101 116 25 C-left 21 51 right 67108896 right 134217848 99 97 112 105 116 97 108 105 tab 45 114 101 103 tab return 5 40 36 25 41 32 123 return tab 36 116 104 105 115 45 62 25 32 61 32 36 25 59 return 125 return] 0 "%d")) arg)))


(defun twig-tornado-template ()
  (interactive)
  (beginning-of-buffer)
  (replace-regexp "przepis\\." "item.")
  (beginning-of-buffer)
  (replace-regexp "przepis\\." "item.")
  (beginning-of-buffer)
  (replace-regexp "item\\.nazwa" "item.name")
  (beginning-of-buffer)
  (replace-regexp "item\\.opis" "item.description")
  (beginning-of-buffer)
  (replace-regexp "item\\.sklad" "item.ingredients")
  (beginning-of-buffer)
  (replace-regexp "item\\.przygotowanie" "item.preparation")
  (beginning-of-buffer)
  (replace-regexp "endfor" "end")
  (beginning-of-buffer)
  (replace-regexp "endif" "end")
  (beginning-of-buffer)
  (replace-regexp "endblock" "end")
  )


(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))


(setq face-height 100)
(defun toggle-face-height ()
  (interactive)
  (set-face-attribute 'default nil :height face-height)
  (if (equal face-height 100) (setq face-height 150) (setq face-height 100) )
  )
