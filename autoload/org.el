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

(setq org-publish-project-alist
      '(

  ("github"
          ;; Path to your org files.
          :base-directory "~/www/exu.github.com/_org/"
          :base-extension "org"

          ;; Path to your Jekyll project.
          :publishing-directory "~/www/exu.github.com/"
          :recursive t
          :publishing-function org-publish-org-to-html
          ;; should be org-html-publish-to-html in org>=8
          :headline-levels 4
          :html-extension "html"
          :body-only t ;; Only export section between <body> </body>
    )
))


(require 'org-impress-js)

(setq org-agenda-files
      (quote ("~/org/projects/index.org"
              "~/org/work/crm/todo.org"
              "~/org/work/network.org"
              "~/org/projects/sajter.org"
              "~/org/english.org"
              "~/org/work/todo.org"
              "~/org/work/wiki.org"
              "~/org/priv/todo.org"
              "~/org/work/crm/deploy.org"
              "~/org/journal.org"
              "~/org/habits.org"))
      org-link-frame-setup (quote ((vm . vm-visit-folder) (gnus . gnus) (file . find-file) (wl . wl)))
      org-startup-folded nil)

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


;; TODO: make some nice CSS
(setq org-export-html-style "
   <style type=\"text/css\">
    <![CDATA[
@media all
{
  body {
    margin: 10px 8% 10px 8%;
    font-family: Verdana;
    text-align: justify;
    font-size: 10pt;
    padding: 10px;
    line-height: 1.2em;
  }

  a {
    color: #bb0000;
  }

  #table-of-contents {
    color: black;
    background: #FFF;
    font-size: 80%;
    padding: .5em;
    margin: 1em -2em 1em 1em;
    display: block;
    float:left;
    font-size: 8pt;
  }

  #table-of-contents li  {
    margin: .2em;
  }

  #table-of-contents h2 {
    margin-top: .2em;
    border: none;
  }

  #license {
    padding: .3em;
    border: 1px solid grey;
    background-color: #eeeeee;
    font-size: 80%;
  }

  h1 {
    font-size: 12pt;
  }

  .title {
    color: gray;
    padding-bottom: 5px;
    margin-bottom: 10px;
    border-bottom: 1px solid #999;
  }

  h2 {
    font-size: 12pt;
    padding-bottom: 4px;
    margin-bottom: 5px;
    border-bottom: 3px solid #DDD;
  }

  h3 {
    font-size: 11pt;
    color: #333333;
  }

  h4 {
    font-size: 9pt;
  }

} /* END OF @media all */



@media screen
{
  #table-of-contents {
    float: right;
    border: 1px solid #CCC;
    max-width: 50%;
    overflow: auto;
  }
} /* END OF @media screen */
    ]]>
   </style>")
