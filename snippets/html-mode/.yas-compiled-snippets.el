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
                       ("exb" "{% extends '::base.html.twig' %}\n{% block body %}\n\n{% endblock %}\n" "exb" nil nil nil nil nil nil)
                       ("html5" "<!DOCTYPE HTML>\n\n<html>\n\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n	<title>Your Website</title>\n</head>\n\n<body>\n\n	$(1:<header>\n		<nav>\n			<ul>\n				<li>Your menu</li>\n			</ul>\n		</nav>\n	</header>)\n\n	<section>\n\n		$(2:<article>\n			<header>\n				<h2>Article title</h2>\n				<p>Posted on <time datetime=\"2009-09-04T16:31:24+02:00\">September 4th 2009</time> by <a href=\"#\">Writer</a> - <a href=\"#comments\">6 comments</a></p>\n			</header>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n		</article>\n\n		<article>\n			<header>\n				<h2>Article title</h2>\n				<p>Posted on <time datetime=\"2009-09-04T16:31:24+02:00\">September 4th 2009</time> by <a href=\"#\">Writer</a> - <a href=\"#comments\">6 comments</a></p>\n			</header>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n		</article>)\n\n	</section>\n\n	$(4:<aside>\n		<h2>About section</h2>\n		<p>Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n	</aside>)\n\n	$(5:<footer>\n		<p>Copyright 2009 Your name</p>\n	</footer>)\n\n</body>\n\n</html>" "html5" nil nil nil nil "direct-keybinding" nil)))


;;; Do not edit! File generated at Tue May 21 14:40:54 2013
