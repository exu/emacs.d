;; org-mode
(setq org-directory "~/org/")
(setq org-default-notes-file "~/Dropbox/Dokumenty/org/notes.org")
(define-key global-map "\C-cc" 'org-capture)
(setq org-return-follows-link 1)
(setq org-log-done t)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq
 org-agenda-files (quote ("~/org/projects/index.org" "~/org/work/crm/todo.org" "~/org/work/network.org" "~/org/projects/sajter.org" "~/Dropbox/Dokumenty/org/english.org" "~/org/work/todo.org" "~/org/priv/todo.org" "~/org/work/crm/deploy.org" "~/org/journal.org" "~/org/habits.org"))
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


(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")


(setq org-todo-keywords
      '((sequence "TODO"
                  ;;"PENDING"
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
        ("p" "Private Todo" entry (headline "~/org/priv/todo.org" "Private todo's")
         "* TODO %?\n  %i\n  %a")
        ("w" "Work Todo" entry (headline "~/org/work/todo.org" "Work todo's")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("h" "Habit" entry (headline "~/org/work/todo.org" "Habits")
         "** TODO %?\nSCHEDULED: %t\n:PROPERTIES:\n:STYLE: habit\n:END:\n%a")
        ("c" "Clock" entry (clock)
         "** TODO %?\nSCHEDULED: %t\n:PROPERTIES:\n:STYLE: habit\n:END:\n%a")
        ("e" "English" entry (file+datetree "~/org/english.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ))


;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   (ditaa . t)
   (python . t)
   (emacs-lisp . nil)
   (sh . nil)
   ))


(setq org-agenda-custom-commands
      '(("w" todo "TODO"
         ((org-agenda-sorting-strategy '(priority-down))
          (org-agenda-prefix-format "  Mixed: ")))
        ))


(setq org-use-speed-commands t)


(defun org-workday (&optional mark)
  "For [work]daily entries. Designed to be called by
diary-sexp-entry with date and entry bound:\n
* 09:00-10:00: Weekly planning meeting of doom
  <%%(org-workday)>"
  (if (memq (calendar-day-of-week date) '(1 2 3 4 5))
      (cons mark entry)))
