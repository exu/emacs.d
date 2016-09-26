;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("uml" "#+begin_src plantuml :results replace output :exports results :file $1.png\n$0\n#+end_src\n" "uml" nil nil nil "/home/exu/.emacs.d/snippets/org-mode/uml" nil nil)
                       ("title" "#+TITLE: $1\n#+AUTHOR: ${2:Jacek Wysocki <jacek.wysocki@gmail.com>}\n#+OPTIONS: toc:nil\n${3:#+STARTUP: nofold}\n$0" "title" nil nil nil "/home/exu/.emacs.d/snippets/org-mode/title" nil nil)
                       ("ssr" "#+begin_src ${2:$$(yas/choose-value '(\"javascript\" \"php\"  \"sh\" \"ruby\" \"json\" \"python\" \"bash\" \"zsh\" \"go\" \"c\" \"c++\" \"sql\"))}\n$0\n#+end_src\n" "ssr" nil nil nil "/home/exu/.emacs.d/snippets/org-mode/ss" nil nil)
                       ("src" "#+begin_src ${2:$$(yas/choose-value '(\"javascript\" \"php\"  \"sh\" \"ruby\" \"json\" \"python\" \"bash\" \"zsh\" \"go\" \"c\" \"c++\" \"sql\"))} :results replace output :exports both\n$0\n#+end_src\n" "src" nil nil nil "/home/exu/.emacs.d/snippets/org-mode/src" nil nil)
                       ("jtitle" "#+STARTUP: showall indent\n#+STARTUP: hidestars\n#+OPTIONS: H:4 num:nil tags:nil toc:nil timestamps:t\n#+BEGIN_HTML\n---\nlayout: post\ntitle: $1\ndate: `(format-time-string \"%Y-%m-%d %H:%M:%S UTC\")`\nupdated: `(format-time-string \"%Y-%m-%d %H:%M:%S UTC\")`\ncomments: true\ncategory: ${2:editor}\ntags: [$3]\n---\n{% include JB/setup %}\n#+END_HTML\n$0" "jekyll title" nil nil nil "/home/exu/.emacs.d/snippets/org-mode/jekyll_title" nil nil)
                       ("img" "#+BEGIN_HTML\n<img src=\"$1\" class=\"${2:img-responsive}\" alt=\"$3\">\n#+END_HTML" "img" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/org-mode/img" nil nil)
                       ("html" "#+BEGIN_HTML\n$0\n#+END_HTML" "html" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/org-mode/html" nil nil)
                       ("dot" "#+begin_src dot :results replace output :exports results :file $1.png\n$0\n#+end_src\n" "dot" nil nil nil "/home/exu/.emacs.d/snippets/org-mode/dot" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016
