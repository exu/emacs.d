;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
                     '(("atpl" "<!doctype html>\n<html>\n	  <head>\n		    <title>$1</title>\n		    <link rel=\"stylesheet\" href=\"http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css\">\n	  </head>\n    <body>\n\n        <div class=\"container\" ng-app=\"myApp\">\n            <h1>$1</h1>\n	          <hr>\n\n	          <div ng-controller=\"$2Ctrl\">\n                 $3\n	          </div>\n        </div>\n\n        <script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.2.4/angular.min.js\"></script>\n        <script type=\"text/javascript\" src=\"app.js\"></script>\n    </body>\n</html>\n" "Simple template for quick html tests with angular" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/web-mode/ttpl" nil nil)
                       ("ready" "\\$(document).ready(function() {\n	${0:// Stuff to do as soon as the DOM is ready;}\n});\n" "ready" nil nil nil "/home/exu/.emacs.d/snippets/web-mode/ready" nil nil)
                       ("html5" "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"utf-8\"/>\n    <title>$1</title>\n    <!--\n    <link href=\"css/some-stylesheet.css\" rel=\"stylesheet\"/>\n    <script src=\"scripts/some-script.js\"/>\n    <script>\n    </script>\n    -->\n</head>\n<body>\n    $2\n</body>\n</html>" "html 5 snippet" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/web-mode/html5" nil nil)
                       ("debug" "<pre>\n{% debug %}\n</pre>" "debug" nil nil nil "/home/exu/.emacs.d/snippets/web-mode/debug" nil nil)
                       ("bf" "<div class=\"form-group col-md-$1 col-sm-$1 col-xs-$1 col-lg-$1\">\n    <label for=\"${2:entity}_${3:field}\" class=\"control-label\">$4</label>\n    <input ng-model=\"$2.$3\" type=\"text\" class=\"form-control\" id=\"$2_$3\">\n</div>\n$0" "bootstrap form" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/web-mode/bf" nil nil)
                       ("bco" "col-md-offset-$1 col-sm-offset-$1 col-xs-offset-$1 col-lg-offset-$1" "bootstrap class attribute inline offset" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/web-mode/bco" nil nil)
                       ("bcc" "col-md-$1 col-sm-$1 col-xs-$1 col-lg-$1" "bootstrap class attribute inline" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/web-mode/bcc" nil nil)
                       ("bc" "class=\"col-md-$1 col-sm-$1 col-xs-$1 col-lg-$1\"" "bootstrap class attribute" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/web-mode/bc" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016
