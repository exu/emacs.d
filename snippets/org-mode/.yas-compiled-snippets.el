;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("jtitle" "#+STARTUP: showall indent\n#+STARTUP: hidestars\n#+OPTIONS: H:4 num:nil tags:nil toc:nil timestamps:t\n#+BEGIN_HTML\n---\nlayout: post\ntitle: $1\ndate: `(format-time-string \"%Y-%m-%d %H:%M:%S UTC\")` UTC\nupdated: `(format-time-string \"%Y-%m-%d %H:%M:%S UTC\")` UTC\ncomments: true\ncategory: ${2:editor}\ntags: [$3]\n---\n{% include JB/setup %}\n#+END_HTML\n$0" "jekyll title" nil nil nil nil nil nil)
                       ("src" "#+begin_src ${2:$$(yas/choose-value '(\"php\" \"sh\" \"ruby\" \"javascript\"))} :results replace output :exports both\n$0\n#+end_src\n" "src" nil nil nil nil nil nil)
                       ("title" "#+TITLE: $1\n#+AUTHOR: ${2:Jacek Wysocki <jacek.wysocki@gmail.com>}\n#+OPTIONS: toc:nil\n${3:#+STARTUP: nofold}\n$0" "title" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jun  6 08:15:07 2013
