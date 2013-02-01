;;; Compiled snippets and support files for `html-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
                     '(("%eif" "{% endif %}" "%eif" nil nil nil nil nil nil)
                       ("%for" "{% for $1 in $2 %}\n   $3\n{% endfor %}" "%for" nil nil nil nil nil nil)
                       ("%if" "{% if $1 %}\n   $2\n{% endif %}" "%if" nil nil nil nil nil nil)
                       ("%ife" "{% if $1 %}\n   $2\n{% else %}\n   $3\n{% endif %}" "%ife" nil nil nil nil nil nil)
                       ("%lif" "{% if $1 %}$2{% endif %}" "%lif" nil nil nil nil nil nil)
                       ("%life" "{% if $1 %}$2{% else %}$3{% endif %}" "%life" nil nil nil nil nil nil)
                       ("%v" "{{ $1 }}" "%v" nil nil nil nil nil nil)
                       ("exb" "{% extends '::base.html.twig' %}\n{% block body %}\n\n{% endblock %}\n" "exb" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jan 24 08:59:13 2013
