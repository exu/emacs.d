;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("src" "#+begin_src ${2:$$(yas/choose-value '(\"php\" \"sh\" \"ruby\" \"javascript\"))} :results replace output :exports both\n$0\n#+end_src\n" "src" nil nil nil nil nil nil)
                       ("title" "#+TITLE: $1\n#+AUTHOR: ${2:Jacek Wysocki <jacek.wysocki@gmail.com>}\n#+OPTIONS: toc:nil\n${3:#+STARTUP: nofold}\n$0" "title" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Apr 17 10:19:03 2013
