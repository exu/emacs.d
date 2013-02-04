;;; Compiled snippets and support files for `sh-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'sh-mode
                     '(("!env" "#!/usr/bin/env `(file-name-nondirectory (getenv \"SHELL\"))`\n" "#!/usr/bin/env $SHELL" nil nil nil nil nil nil)
                       ("README.markdown" "# Snippets for Shell Mode\n\n## About\n\nCollection of Shell snippets for\n[yasnippet](http://code.google.com/p/yasnippet/ \"yasnippet - Google Code\").\nSome of them are based on snippets in TextMate's ShellScript bundle.\n\n## Contributors\n\nAll snippets by Bjørn Arild Mæland <bjorn.maeland at gmail.com>, unless\notherwise stated.\n\nPlease feel free to contribute useful snippets. The prefered way is to fork the\nrepos and send a pull request.\n" "README.markdown" nil nil nil nil nil nil)
                       ("case" "case ${1:word} in\n  ${2:pattern} )\n    $0;;\nesac\n" "case ... esac" nil nil nil nil nil nil)
                       ("elif" "elif [[ ${1:condition} ]]; then\n  ${0:statements}\n" "elif ..." nil nil nil nil nil nil)
                       ("for" "for ${1:condition}; do\n  ${0:statements}\ndone\n" "for ... done" nil nil nil nil nil nil)
                       ("forin" "for ${1:i} in ${2:words}; do\n  ${0:statements}\ndone\n" "for ... in ... done" nil nil nil nil nil nil)
                       ("fun" "function ${1:function_name}()\n{\n  $0\n}" "function name { ... }" nil nil nil nil nil nil)
                       ("here" "<<${1:TOKEN}\n$0\n${1:TOKEN}\n" "Here Document" nil nil nil nil nil nil)
                       ("if" "if [ ${1:condition} ]; then\n  ${0:statements}\nfi\n" "if ... fi" nil nil nil nil nil nil)
                       ("ift" "if [[ ${1:condition} ]]; then\n  ${0:statements}\nfi\n" "if [[ test ]] ... fi" nil nil nil nil nil nil)
                       ("until" "until [[ ${1:condition} ]]; do\n  ${0:statements}\ndone\n" "until ... done" nil nil nil nil nil nil)
                       ("while" "while [[ ${1:condition} ]]; do\n  ${0:statements}\ndone\n" "while ... done" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Feb  3 12:43:47 2013
