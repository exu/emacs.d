;; org-mode
(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/notes.org")
(define-key global-map "\C-cc" 'org-capture)
(setq org-return-follows-link 1)
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-agenda-window-setup 'current-window)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-export-allow-BIND t)
(setq org-export-publishing-directory "~/www/poligon/html/")

(add-to-list 'load-path "~/.emacs.d/vendor/org-8/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor/org-8/contrib/lisp")

(setq org-export-backends '(taskjuggler s5 freemind deck md odt latex icalendar html ascii))
(require 'org)
(require 'ox-md)
(require 'ox-html)

;; Appointments
(add-hook 'org-finalize-agenda-hook 'exu-org-agenda-to-appt 'append)
(setq appt-audible t)
(appt-activate t)
(run-at-time "24:01" nil 'exu-org-agenda-to-appt)
(exu-org-agenda-to-appt)
(setq
  appt-display-mode-line t     ;; show in the modeline
  appt-display-format 'window) ;; use our func
(appt-activate 1)              ;; active appt (appointment notification)
(display-time)                 ;; time display is required for this...

 ;; update appt each time agenda opened
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)
(setq appt-disp-window-function (function exu-appt-display))


;; Projects
(setq org-publish-project-alist
      '(
        ("github"
         ;; Path to your org files.
         :base-directory "~/www/exu.github.com/_org/"
         :base-extension "org"

         ;; Path to your Jekyll project.
         :publishing-directory "~/www/exu.github.com/"
         :recursive t
         :publishing-function org-html-publish-to-html
         ;; should be org-html-publish-to-html in org>=8
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )
        ("work"
         ;; Path to your org files.
         :base-directory "~/org/work/"
         :base-extension "org"

         ;; Path to your Jekyll project.
         :publishing-directory "~/www/poligon/html/"
         :publishing-function org-html-publish-to-html
         :headline-levels 10
         :html-extension "html"
         )
        ))


(require 'org-impress-js)

(setq org-agenda-files
      (quote (
              "~/org/english.org"
              "~/org/habits.org"
              "~/org/journal.org"
              "~/org/priv/todo.org"
              "~/org/projects/index.org"
              "~/org/projects/sajter.org"
              "~/org/work/architecture.org"
              "~/org/work/todo.org"
              "~/org/work/wiki.org"
              ))
      org-link-frame-setup (quote ((vm . vm-visit-folder) (gnus . gnus) (file . find-file) (wl . wl)))
      org-startup-folded nil)

;; refile to all agenda files
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))


(add-to-list 'org-modules "org-habit")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:foreground "#259185" :height 1.6))))
 '(org-link ((t (:foreground "yellow" :underline t))))
;; '(org-date ((t (:underline f))))
 '(org-table ((t (:foreground "deep sky blue")))))


(setq org-todo-keywords
      '((sequence "TODO"
                  "PENDING"
                  ;;"FUTURE"
                  "DONE"
                  )))

(setq org-todo-keyword-faces
      '(
        ("FUTURE" . (:foreground "lightblue" :weight bold))
        ("PENDING"  . (:foreground "orange" :weight bold))
        ))

(setq org-capture-templates
      '(
        ("p" "Private Todo" entry (headline "~/org/priv/todo.org" "Todo")
         "* TODO %?\n  %i\n  %a")
        ("w" "Work Todo" entry (headline "~/org/work/todo.org" "Todo")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ;; ("h" "Habit" entry (headline "~/org/work/todo.org" "Habits")
        ;;  "** TODO %?\nSCHEDULED: %t\n:PROPERTIES:\n:STYLE: habit\n:END:\n%a")
        ("c" "Clock" entry (clock)
         "** TODO %?\nSCHEDULED: %t\n:PROPERTIES:\n:STYLE: habit\n:END:\n%a")
        ("e" "English" entry (file+datetree "~/org/english.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ))


(setq org-capture-templates
      '(
        ("w" "Work Todo" entry (file+olp "~/org/work/todo.org" "Todo")
         "* TODO %?\t:5353:\n")
        ("p" "Private Todo" entry (file+olp "~/org/priv/todo.org" "Todo")
         "* TODO %?\t:5353:\n")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("e" "English" entry (file+datetree+prompt "~/org/english.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("d" "Work Todo" entry (file+olp "~/org/work/todo.org"  (current-date))
         "* TODO %?\t:5353:\n")
        ))


;; active Babel languages
(setq org-plantuml-jar-path  (expand-file-name "~/Appz/plantuml.jar"))
(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")

;; for code exec in org babel src blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   (ditaa . t)
   (python . t)
   (emacs-lisp . t)
   (sh . t)
   (plantuml . t)
   ))


(setq org-agenda-custom-commands
      '(("w" todo "TODO"
         ((org-agenda-sorting-strategy '(priority-down))
          (org-agenda-prefix-format "  Mixed: ")))
        ))


(setq org-use-speed-commands t)

(defun exu-org-confirm-babel-evaluate (lang body)
    (not (or (string= lang "plantuml") (string= lang "sh"))))  ; don't ask for plant
(setq org-confirm-babel-evaluate 'exu-org-confirm-babel-evaluate)


(defun org-workday (&optional mark)
  "For [work]daily entries. Designed to be called by
diary-sexp-entry with date and entry bound:\n
* 09:00-10:00: Weekly planning meeting of doom
  <%%(org-workday)>"
  (if (memq (calendar-day-of-week date) '(1 2 3 4 5))
      (cons mark entry)))


(load "~/.emacs.d/vendor/ORGMODE-Markdown/markdown.el")


;; Tables default attribs
(setq org-html-table-default-attributes
      '(:class "table-stripped" :border "2" :cellspacing "0" :cellpadding "6" :rules "groups" :frame "hsides"))

(setq org-html-preamble t)
(setq org-html-preamble-format
      '(("en" "<a name=\"top\"></a>
<div class=\"navbar navbar-fixed-bottom\">
  <div class=\"navbar-inner\">
    <span class=\"author-icon\"></span>
    <a class=\"brand\" href=\"#top\">&nbsp;Jacek Wysocki Notes</a>
    <ul class=\"nav\">
      <li><a href=\"#\">Goto top</a></li>
      <li><a href=\"mailto:jacek.wysocki@gmail.com\">Email</a></li>
      <li><a href=\"http://wysocki.org.pl\">WWW</a></li>
    </ul>
  </div>
</div>")))

(setq org-html-postamble t)
(setq org-html-postamble-format
      '(("en" "Last Updated %d.<br> Created by %a (%e)<br>%c")))


;; Org-mode HTML export style
;; Imported from ./org.css
(setq org-html-head
      (concat "<style type=\"text/css\">
   /*<![CDATA[*/
"
              (setq css (with-temp-buffer
                          (insert-file-contents "~/.emacs.d/autoload/org.css")
                          (buffer-string)))
              "
/*]]>*/
   </style>"))


;; I cant make
;; #+BIND: org-export-publishing-directory "~/www/poligon/html/"
;; to work so there is simple workaround which I need for my two recently edited
;; and presented files

(defun org-export-work-file (name)
  "Exports ~/org/work/NAME.org to html"
  (setq bn (buffer-file-name))
  (find-file (concat "~/org/work/" name ".org"))
  (org-html-export-to-html nil)
  (rename-file (concat "~/org/work/" name ".html") (concat "~/www/poligon/html/" name ".html") t)
  (find-file bn))

(defun org-export-work-todo ()
  (interactive)
  (org-export-work-file "todo"))

(defun org-export-work-architecture ()
  (interactive)
  (org-export-work-file "architecture"))



(add-hook 'after-save-hook
          (lambda ()
            (if (string= (buffer-file-name) "/home/exu/org/work/todo.org")
                (org-export-work-todo))
            (if (string= (buffer-file-name) "/home/exu/org/work/architecture.org")
                (org-export-work-architecture))
            )
          )
