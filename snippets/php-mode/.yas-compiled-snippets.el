;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("class" "`(progn (save-buffer) (php-symfony2-generate-namespace))`\n\n/**\n * @author Jacek Wysocki <jacek.wysocki@gmail.com>\n */\nclass ${1:`(replace-regexp-in-string\n \"\\\\.php\" \"\" (file-name-base))`}\n{\n    public function __construct($options=array())\n    {\n        if (is_array($options)) {\n            foreach ($options as $k => $v) {\n                $this->$k = $v;\n            }\n        }\n        $0\n    }\n}\n" "symfony2 based class template" nil
                        ("definitions")
                        nil nil nil nil)
                       ("/*" "/**\n * $1\n */" "symfony2 based class template" nil
                        ("annotations")
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("cpr" "echo var_export(${1:var}, 1);\n" "cpr" nil nil nil nil nil nil)
                       ("while" "do {\n   $1\n} while (${2:condition})\n$0" "while statement" nil
                        ("control structures")
                        nil nil nil nil)
                       ("ex" "throw new Exception('${1:Message}');" "ex" nil nil nil nil nil nil)
                       ("for" "for (${1:$i = 0}; ${2:$i < $condition}; ${3:$i++}) {\n   $0\n}\n" "for loop" nil
                        ("control structures")
                        nil nil nil nil)
                       ("foreach" "foreach (${1:$iterator} as ${2:$key => $value}) {\n   $0\n}\n" "foreach loop" nil
                        ("control structures")
                        nil nil nil nil)
                       ("fun" "function ${1:functionName}($2)\n{\n   $0\n}\n" "function template" nil
                        ("definitions")
                        nil nil nil nil)
                       ("gs" "\nprotected $$1;\n\npublic function get${1:$(capitalize text)}()\n{\n    return $this->$1;$2\n}\n\npublic function set${1:$(capitalize text)}($$1)\n{\n    $this->$1 = $$1;$3\n    return $this;\n}\n$0" "Getter and setter" nil
                        ("definitions")
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("if" "if (${1:condition}) {\n   $0\n}\n" "if" nil
                        ("control structures")
                        nil nil nil nil)
                       ("ife" "if (${1:condition}) {\n  $2\n} else {\n  $0\n}\n" "if else" nil
                        ("control structures")
                        nil nil nil nil)
                       ("mode" "/* -*- mode: php -*- */" "mode" nil nil nil nil nil nil)
                       ("php" "<?php\n/**\n * @author Jacek Wysocki <jacek.wysocki@gmail.com>\n */\n\n $0" "existing <?php file template" nil
                        ("templates")
                        nil nil nil nil)
                       ("pre" "echo \"<PRE>\" . var_export($1, 1) . \"</PRE>\";\n" "pre" nil
                        ("debug")
                        nil nil nil nil)
                       ("pri" "private function ${1:name}($2)\n{\n   $0\n}\n" "private method template" nil
                        ("definitions")
                        nil nil nil nil)
                       ("pro" "protected function ${1:methodName}()\n{\n   $0\n}\n" "protected method template" nil
                        ("definitions")
                        nil nil nil nil)
                       ("pub" "public function ${1:methodName}($2)\n{\n   $0\n}\n" "public method template" nil
                        ("definitions")
                        nil nil nil nil)
                       ("@AFile" "/**\n * @Assert\\File(maxSize=\"${1:6000000}\")\n */\n" "Sf2 Assert File" nil
                        ("symfony2")
                        nil nil nil nil)
                       ("@AImage" "/**\n * @Assert\\Image(\n *     minWidth = 200,\n *     maxWidth = 400,\n *     minHeight = 200,\n *     maxHeight = 400,\n * )\n */" "Sf2 Assert Image" nil
                        ("symfony2")
                        nil nil nil nil)
                       ("@T" "/**\n * @Template($1)\n */$0" "Sf2 Tempalte" nil
                        ("symfony2")
                        nil nil nil nil)
                       ("sfa" "/**\n * @author Jacek Wysocki <jacek.wysocki@gmail.com>\n *\n * @Route(\"/$1\", name=\"$1\")\n * @Template()\n */\npublic function $1Action($2)\n{\n    $0\n    return array();\n}\n" "add symfony2 controller action" nil
                        ("definitions")
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("switch" "switch (${1:true}) {\n    case $2:\n        $3\n        break;\n    default:\n        $4\n}$0\n" "switch statement" nil
                        ("control structures")
                        nil nil nil nil)
                       ("try" "try {\n  `yas/selected-text`$1\n} catch (${2:\\Exception} ${3:$e}){\n  $0\n}\n" "try catch block" nil
                        ("control structures")
                        nil nil nil nil)
                       ("while" "while (${1:condition}) {\n   $0\n}\n" "while statement" nil
                        ("control structures")
                        nil nil nil nil)))


;;; Do not edit! File generated at Tue May 21 14:40:54 2013
