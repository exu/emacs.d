;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("<?php" "<?php\n/**\n * ${1:file_title}\n *\n * @package   ${2:package}\n * @author    ${3:author} <${4:email}>\n * @copyright Copyright (c) ${5:`(format-time-string \"%Y\" (current-time))`} ${6:copyright}\n */\n\n/**\n * $1\n *\n * ${7:description}\n *\n * @package $2\n * @author  $3 <$4>\n * @copyright Copyright (c) $5 $6\n */\nclass ${8:`(replace-regexp-in-string\n \"^_+\" \"\"\n (mapconcat\n  #'identity\n  (split-string\n   ((lambda (a)\n      (substring a (let ((case-fold-search nil))\n                     (string-match \"\\\\\\\\(/[A-Z][a-zA-Z0-9]+\\\\\\\\)+$\" a )\n                     ))\n      )\n    (file-name-sans-extension (buffer-file-name))\n    ) \"/\") \"_\"))`}\n{\n   public function ${9:__construct}()\n   {\n      $0\n   }\n}\n" "<?php /* ... */ class ...{...} " nil
                        ("definitions")
                        nil nil nil nil)
                       ("class" "/**\n * @author Jacek Wysocki <jacek.wysocki@gmail.com>\n */\nclass ${1:`(replace-regexp-in-string\n \"^_+\" \"\"\n (mapconcat\n  #'identity\n  (split-string\n   ((lambda (a)\n      (substring a (let ((case-fold-search nil))\n                     (string-match \"\\\\\\\\(/[A-Z][a-zA-Z0-9]+\\\\\\\\)+$\" a )\n                     ))\n      )\n    (file-name-sans-extension (buffer-file-name))\n    ) \"/\") \"_\"))`}\n{\n    public function __construct($options=array())\n    {\n        if (is_array($options)) {\n            foreach ($options as $k => $v) {\n                $this->$k = $v;\n            }\n        }\n        $0\n    }\n}\n" "class ... " nil
                        ("definitions")
                        nil nil nil nil)
                       ("cpr" "echo var_export(${1:var}, 1);\n" "cpr" nil nil nil nil nil nil)
                       ("ex" "throw new Exception('${1:Message}');" "ex" nil nil nil nil nil nil)
                       ("gs" "function $1($2)\n{\n    $3\n}#contributor : Satoshi Nishimura <nishim314@gmail.com>\n#contributor : Jacek Wysocki <jacek.wysocki@gmail.com>\n#name : f ...(...)\n#group : definitions\n# --\nfunction ${1:name}(${2:$args})\n{\n   $0\n}\n" "Getter and setter" nil nil nil nil nil nil)
                       ("for" "for (${1:$i = 0}; ${2:$i < $condition}; ${3:$i++}) {\n   $0\n}\n" "for (...) {...}" nil
                        ("control structure")
                        nil nil nil nil)
                       ("fore" "foreach (${1:$iterator} as ${2:$key => $value}) {\n   $0\n}\n" "fore (...) {...}" nil
                        ("control structure")
                        nil nil nil nil)
                       ("function" "function ${1:name}(${2:$args})\n{\n   $0\n}\n" "function ...(...)" nil
                        ("definitions")
                        nil nil nil nil)
                       ("gs" "\nprotected $$1;\n\n/*\n * Getter for $1\n */\npublic function get${1:$(capitalize text)}() {\n    return $this->$1;$2\n}\n\n/*\n * Setter for $1\n */\npublic function set${1:$(capitalize text)}($$1) {\n    $this->$1 = $$1;$3\n    return $this;\n}\n$0" "Getter and setter" nil nil nil nil nil nil)
                       ("if" "if (${1:condition}) {\n   $0\n}\n" "if (...) {...}" nil
                        ("control structure")
                        nil nil nil nil)
                       ("ife" "if (${1:condition}) {\n  $2\n}else{\n  $0\n}\n" "if (...) {...} else { ... }" nil
                        ("control structure")
                        nil nil nil nil)
                       ("mode" "/* Local Variables: */\n/* mode:php */\n/* End: */" "mode" nil nil nil nil nil nil)
                       ("php" "<?php\n/**\n * ${1:file_title}\n *\n * @package   ${2:package}\n * @author    ${3:Jacek Wysocki} <${4:jacek.wysocki@gmail.com}>\n * @copyright Copyright (c) ${5:`(format-time-string \"%Y\" (current-time))`} ${6:copyright}\n */\n\n/**\n * $1\n *\n * ${7:description}\n *\n * @package $2\n * @author  $3 <$4>\n * @copyright Copyright (c) $5 $6\n */\nclass ${8:`(let ((fn (capitalize (file-name-nondirectory\n                                 (file-name-sans-extension\n                 (or (buffer-file-name)\n                     (buffer-name (current-buffer))))))))\n       (replace-regexp-in-string \"_\" \"\" fn)\n       (replace-regexp-in-string \"\\.Class\" \"\" fn)\n       )`} ${9:$$(yas/choose-value '(\" \" \"extends\" \"implements\"))}\n{\n    public function __construct($options=array())\n    {\n        if (is_array($options)) {\n            foreach ($options as $k => $v) {\n                $this->$k = $v;\n            }\n        }\n        $0\n    }\n}\n" "<?php" nil
                        ("definitions")
                        nil nil nil nil)
                       ("pre" "echo \"<PRE>\" . var_export($1, 1) . \"</PRE>\";\n" "pre" nil nil nil nil nil nil)
                       ("pri" "private function ${1:name}(${2:$args})\n{\n   $0\n}\n" "pri ...(...)" nil
                        ("definitions")
                        nil nil nil nil)
                       ("pro" "protected function ${1:name}(${2:$args})\n{\n   $0\n}\n" "pro ...(...)" nil
                        ("definitions")
                        nil nil nil nil)
                       ("pub" "public function ${4:name}($5)\n{\n   $0\n}\n" "pub ...(...)" nil
                        ("definitions")
                        nil nil nil nil)
                       ("sfa" "" "sfa" nil nil nil nil nil nil)
                       ("switch" "switch (${1:true}) {\ncase $2:\n    $0\ndefault:\n}\n" "switch (...) {...}" nil
                        ("control structure")
                        nil nil nil nil)
                       ("try" "try {\n  $1\n} catch (${2:Exception} ${3:$e}){\n  $0\n}\n" "try { ... } catch ( ... ){ ... }" nil
                        ("control structure")
                        nil nil nil nil)
                       ("while" "while (${1:condition}) {\n   $0\n}\n" "while (...) {...}" nil
                        ("control structure")
                        nil nil nil nil)))


;;; Do not edit! File generated at Thu Jan 24 08:59:13 2013
