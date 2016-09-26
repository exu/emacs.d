;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("while" "while (${1:condition}) {\n   $0\n}\n" "while statement" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/while" nil nil)
                       ("try" "try {\n  `yas/selected-text`$1\n} catch (${2:\\Exception} ${3:$e}) {\n  $0\n}\n" "try catch block" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/try" nil nil)
                       ("tr" "`(progn (save-buffer) (php-symfony2-generate-namespace))`\n\ntrait ${1:`(replace-regexp-in-string \"\\\\.php\" \"\" (file-name-base))`}\n{\n    $0\n}\n" "trait" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/trait_template" nil nil)
                       ("tr" "`(php-symfony2-generate-namespace)\n\ntrait $1\n{\n    $0\n}\n" "trait" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/trait" nil nil)
                       ("time" "" "time" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/time" nil nil)
                       ("switch" "switch (${1:true}) {\n    case $2:\n        $3\n        break;\n    default:\n        $4\n}$0\n" "switch statement" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/switch" nil nil)
                       ("use" "`(php-symfony2-use)`" "use statement from existing classes in src/ dir" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/sf2_use" nil nil)
                       ("@T" "/**\n * @Template($1)\n */$0" "Symfony2 Controller Annotation Tempalte" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/sf2_template" nil nil)
                       ("col" "/**\n * @ORM\\Column(name=\"${2:column_name}\", type=\"${3:yas-text}\")\n */\nprivate $${2:$(underscore-to-camelcase-string yas-text)};\n\npublic function ${2:$(underscore-to-camelcase-string (concat \"get_\" yas-text))}()\n{\n    return $this->${2:$(underscore-to-camelcase-string yas-text)};\n}\n\npublic function ${2:$(underscore-to-camelcase-string (concat \"set_\" yas-text))}($${2:$(underscore-to-camelcase-string yas-text)})\n{\n    $this->${2:$(underscore-to-camelcase-string yas-text)} = $${2:$(underscore-to-camelcase-string yas-text)};\n    return $this;\n}" "Symfony2 ORM Column" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/sf2_orm_column" nil nil)
                       ("rawquery" "$query = $queryBuilder->getQuery();\n\n$sql = sprintf(\n    str_replace(\"?\", \"%s\", $query->getSQL()),\n    $query->getParameter('userId')->getValue(),\n    implode(',', $query->getParameter('activityEuids')->getValue()),\n    $query->getParameter('courseId')->getValue()\n);\n\necho print_r($sql, 1);\n" "Doctrine raw query" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/php-mode/sf2_doctrine_rawquery" nil nil)
                       ("@AImage" "/**\n * @Assert\\Image(\n *     minWidth = 200,\n *     maxWidth = 400,\n *     minHeight = 200,\n *     maxHeight = 400,\n * )\n */" "Symfony2 Assert Image" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/sf2_assert_image" nil nil)
                       ("@AFile" "/**\n * @Assert\\File(maxSize=\"${1:6000000}\")\n */\n" "Symfony2 Assert File" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/sf2_assert_file" nil nil)
                       ("sfa" "/**\n * @author Jacek Wysocki <jacek.wysocki@gmail.com>\n *\n * @Route(\"/$1\", name=\"$1\")\n * @Template()\n */\npublic function $1Action($2)\n{\n    $0\n    return array();\n}\n" "symfony2 controller action" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/php-mode/sf2_action" nil nil)
                       ("pui" "\n\n$this->markTestIncomplete('${1:This test has not been implemented yet.}');\n" "PHPUnit Incomplete test" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/phpunit_test_incomplete" nil nil)
                       ("ttpl" "<?php\n`(progn (save-buffer) (php-symfony2-generate-namespace))`\nclass `(progn (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))` extends \\PHPUnit_Framework_TestCase\n{\n    public function test$2()\n    {\n        ${3:$this->markTestIncomplete('This test has not been implemented yet.');}$0\n    }\n}\n" "PHPUnit test template" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/phpunit_template" nil nil)
                       ("dp" "/**\n * @dataProvider $1\n */" "PHPUnit data provider annotation" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/phpunit_data_provider" nil nil)
                       ("ae" "$this->assertEquals(${1:'expected'}, ${2:'result'});$0" "PHPUnit assert equals" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/phpunit_assert_equals" nil nil)
                       ("@r" "@returns $1" "@return" nil
                        ("phpdoc")
                        nil "/home/exu/.emacs.d/snippets/php-mode/phpdoc_insert_return" nil nil)
                       ("@p" "@param $1 $2 - $3" "@param" nil
                        ("phpdoc")
                        nil "/home/exu/.emacs.d/snippets/php-mode/phpdoc_insert_param" nil nil)
                       ("@cc" "@coversDefaultClass $1" "@coversDefaultClass" nil
                        ("phpdoc")
                        nil "/home/exu/.emacs.d/snippets/php-mode/phpdoc_insert_coversdefaultclass" nil nil)
                       ("@c" "@covers $1" "@covers" nil
                        ("phpdoc")
                        nil "/home/exu/.emacs.d/snippets/php-mode/phpdoc_insert_covers" nil nil)
                       ("<" "<?php\n\n$0" "existing <?php file template" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/php_template" nil nil)
                       ("ns" "`(progn (save-buffer) (php-symfony2-generate-namespace))`\n$0" "symfony2 based class template" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/namespace" nil nil)
                       ("mode" "/* -*- mode: php -*- */" "mode" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/mode" nil nil)
                       ("pub" "public function ${1:methodName}($2)\n{\n   $0\n}\n" "public method template" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/method_public" nil nil)
                       ("pro" "protected function ${1:methodName}()\n{\n   $0\n}\n" "protected method template" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/method_protected" nil nil)
                       ("t" "True" "True" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/method_private" nil nil)
                       ("if_else" "if (${1:condition}) {\n  $2\n} else {\n  $0\n}\n" "if else" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/if_else" nil nil)
                       ("if" "if (${1:condition}) {\n   $0\n}\n" "if" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/if" nil nil)
                       ("fu" "function ${1:functionName}($2)\n{\n   $0\n}\n" "function template" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/function" nil nil)
                       ("foreach" "foreach (${1:$iterator} as ${2:$key => $value}) {\n   $0\n}\n" "foreach loop" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/foreach" nil nil)
                       ("for" "for (${1:$i = 0}; ${2:$i < $condition}; ${3:$i++}) {\n   $0\n}\n" "for loop" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/for" nil nil)
                       ("ex" "throw new \\Exception(\"${1:Message}\");" "ex" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/exception" nil nil)
                       ("while" "do {\n   $1\n} while (${2:condition})\n$0" "while statement" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/do" nil nil)
                       ("err" "fwrite(STDERR, print_r($1, 1) . \"\\n\");" "std error" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/debug_stderr" nil nil)
                       ("pre" "echo \"<PRE>\" . print_r($1, 1) . \"</PRE>\";\n" "Echo var_export" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/debug_pre" nil nil)
                       ("pp" "print_r($1);\n" "print_r" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/debug_pp" nil nil)
                       ("cpr" "echo print_r(${1:var}, 1);\n" "cpr" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/debug_console" nil nil)
                       ("/*" "/**\n * $1\n */" "php comment block" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/php-mode/comment" nil nil)
                       ("yellow" "\\033[0;33m$1\\033[0m$0" "color yellow" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/php-mode/color_yellow" nil nil)
                       ("red" "\\033[0;31m$1\\033[0m$0" "color red" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/php-mode/color_red" nil nil)
                       ("green" "\\033[0;32m$1\\033[0m$0\n" "color green" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/php-mode/color_green" nil nil)
                       ("class" "`(progn (save-buffer) (php-symfony2-generate-namespace))`\n\n/**\n * @author Jacek Wysocki <jacek.wysocki@gmail.com>\n */\nclass ${1:`(replace-regexp-in-string \"\\\\.php\" \"\" (file-name-base))`}\n{\n    public function __construct($options=array())\n    {\n        if (is_array($options)) {\n            foreach ($options as $k => $v) {\n                $this->$k = $v;\n            }\n        }\n        $0\n    }\n}\n" "symfony2 based class template" nil nil nil "/home/exu/.emacs.d/snippets/php-mode/class_template" nil nil)
                       ("gs" "protected $$1;\n\npublic function get${1:$(ucfirst yas-text)}()\n{\n    return $this->$1;$2\n}\n\npublic function set${1:$(ucfirst yas-text)}($$1)\n{\n    $this->$1 = $$1;$3\n\n    return $this;\n}\n$0" "Getter and setter" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/php-mode/class_getter_setter" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016
