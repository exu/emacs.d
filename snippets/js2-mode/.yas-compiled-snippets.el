;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("while" "while($1){\n    $0\n}\n" "while" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/while" nil nil)
                       ("v" "var $1 = $0\n" "var" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/var" nil nil)
                       ("try" "try {\n  $1\n} catch(error) {\n  $0\n}\n" "try" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/try" nil nil)
                       ("throw" "throw new Error(\"$1\");\n" "throw" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/throw" nil nil)
                       ("switch" "switch($1){\n    case $2:\n        break;\n\n    default:\n    $0\n};\n" "switch" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/switch" nil nil)
                       ("super" "$1.prototype.${2:constructor}.${3:call}($0);\n" "super" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/super" nil nil)
                       ("slice" "Array.prototype.slice.${1:call}($0);\n" "slice" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/slice" nil nil)
                       ("s" "'use strict';" "use strict" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/js2-mode/s" nil nil)
                       ("rt" "return$0;\n" "rt" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/rt" nil nil)
                       ("rr" ",$1 = require('$1')${2:;}$0" "rr" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/rr" nil nil)
                       ("rq" "$1 = require(\"${2:$1}\")${0:,}\n" "rq" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/rq" nil nil)
                       ("ready" "\\$(document).ready(function() {\n	${0:// Stuff to do as soon as the DOM is ready;}\n});\n" "ready" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/ready" nil nil)
                       ("prop" "\nvar $1 = (function(){\n\n  var value = undefined;\n\n  return function $1(newValue){\n\n    if( $1.arguments.length > 0 ){\n      value = newValue;\n    }\n\n    return value;\n  };\n\n})();\n" "prop" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/prop" nil nil)
                       ("plugin" ";(function(\\$) {\n${2:// ${3:What does the $1 plugin do?}}\n\\$.fn.${1:pluginName} = function(options) {\n  var opts = \\$.extend({}, \\$.fn.$1.defaults, options);\n\n  return this.each(function() {\n    var \\$this = \\$(this);\n\n  ${5:  ${6:// Support for the Metadata Plugin.}\n    var o = \\$.meta ? \\$.extend({\\}, opts, \\$this.data()) : opts;\n  }\n\n  });\n\n  // private function for debugging\n  function debug(\\$obj) {\n    if (window.console && window.console.log) {\n      window.console.log(\\$obj);\n    }\n  }\n};\n\n// default options\n\\$.fn.$1.defaults = {\n  ${4:defaultOne:true,\n  defaultTwo:false,\n  defaultThree:'yay!'}\n};\n\n})(jQuery);\n" "plugin" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/plugin" nil nil)
                       ("pe" "process.exit(1);$0" "JS Process Exit" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/pe" nil nil)
                       ("on" ".on('$1', function(${2:error}) { $3 })" "On event" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/on" nil nil)
                       ("ngd" "app.directive(\"$1\", function () {\n    return {\n        restrict: \"${2:$$(yas-choose-value '(\"E\" \"A\" \"C\"))}\",\n\n        require: \"$3\",\n\n        transclude: false,\n\n        scope: {},\n\n        controller: function ($scope) {\n\n        },\n\n        link: function (scope, element, attrs) {\n\n        },\n\n        template: ''\n    };\n});\n" "NG-directive simple" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/js2-mode/ngd" nil nil)
                       ("method" "$1.prototype.$2 = function($3){\n${0}\n};\n" "method" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/method" nil nil)
                       ("m" "$1: function ($2) {\n    $3;\n}$0" "m" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/m" nil nil)
                       ("log" "console.${1:log}( $0 );\n" "log" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/log" nil nil)
                       ("l" "console.log($0);" "l" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/l" nil nil)
                       ("it" "it('$1', function () {\n    $0\n});\n" "it" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/it" nil nil)
                       ("invoc" "(function($1){\n$0\n})($2);\n" "invoc" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/invoc" nil nil)
                       ("if" "if( ${1} ){\n$0\n}\n" "if" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/if" nil nil)
                       ("for" "var i;\nfor(i = 0; i < $1; i++){\n  $2\n}\n" "for" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/for" nil nil)
                       ("fn" "function$1($2){\n$0\n}\n" "fn" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/fn" nil nil)
                       ("ff" "function ($1) { $2; }$0" "f inline" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/ff" nil nil)
                       ("f" "function ($1) {\n    $2;\n}$0" "f" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/f" nil nil)
                       ("exports" "module.exports = {\n$0\n};\n" "exports" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/exports" nil nil)
                       ("cb" "function(error, $1){\n$0\n}\n" "cb" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/cb" nil nil)
                       ("before" "beforeEach(function($1) {\n    $0\n});\n" "before each" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/before" nil nil)
                       ("$.post" "" "$.post" nil nil nil "/home/exu/.emacs.d/snippets/js2-mode/$.post" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016
