;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
                     '(("$.each" "\\$.each(${1:array/object}, function(${2:index}${3:, ${4:val}}) {\n  ${0://iterate through array or object}\n});" "$.each" nil nil nil nil nil nil)
                       ("$.extend" "\\$.extend(${1:true, }${2:target object}, ${3:object1});\n$0" "$.extend" nil nil nil nil nil nil)
                       ("%eif" "{% endif %}" "eif" nil
                        ("twig")
                        nil nil nil nil)
                       ("%for" "{% for $1 in $2 %}\n   $3\n{% endfor %}" "%for" nil nil nil nil nil nil)
                       ("%if" "{% if $1 %}\n   $2\n{% endif %}" "%if" nil nil nil nil nil nil)
                       ("%ife" "{% if $1 %}\n   $2\n{% else %}\n   $3\n{% endif %}" "%ife" nil nil nil nil nil nil)
                       ("%lif" "{% if $1 %}$2{% endif %}" "%lif" nil nil nil nil nil nil)
                       ("%life" "{% if $1 %}$2{% else %}$3{% endif %}" "%life" nil nil nil nil nil nil)
                       ("%v" "{{ $1 }}" "%v" nil nil nil nil nil nil)
                       (":" ":input" ":" nil nil nil nil nil nil)
                       ("class" "# -*- mode: snippet -*-\n#contributor : Jacek Wysocki <jacek.wysocki@gmail.com>\n#name : class template\n#key : class\n#group : definitions\n/**\n * @author Jacek Wysocki <jacek.wysocki@gmail.com>\n */\nclass ${1:`(let ((fn (capitalize (file-name-nondirectory\n                                 (file-name-sans-extension\n                 (or (buffer-file-name)\n                     (buffer-name (current-buffer))))))))\n       (replace-regexp-in-string \"_\" \"\" fn)\n       (replace-regexp-in-string \"\\.Class\" \"\" fn)\n       )`} ${2:$$(yas/choose-value '(\"\" \"extends\" \"implements\"))}\n{\n    public function __construct($options=array())\n    {\n        if (is_array($options)) {\n            foreach ($options as $k => $v) {\n                $this->$k = $v;\n            }\n        }\n        $0\n    }\n}\n" "class" nil nil nil nil nil nil)
                       ("clone" ".clone()$0" "clone" nil nil nil nil nil nil)
                       ("comment" "{% comment %}\n	$1\n{% endcomment %}" "comment" nil nil nil nil nil nil)
                       ("cpr" "echo var_export(${1:var}, 1);\n" "cpr" nil nil nil nil nil nil)
                       ("cycle" "{% cycle $1 as $2 %}" "cycle" nil nil nil nil nil nil)
                       ("date" "${1:FIELDNAME} = models.DateField(2:blank=True, null=True, }${3:auto_now_add=True})" "date" nil nil nil nil nil nil)
                       ("datetime" "${1:FIELDNAME} = models.DateTimeField(${2:blank=True, null=True, }${3:auto_now_add=True})" "datetime" nil nil nil nil nil nil)
                       ("debug" "<pre>\n{% debug %}\n</pre>" "debug" nil nil nil nil nil nil)
                       ("decimal" "${1:FIELDNAME} = models.DecimalField(max_digits=$2, decimal_places=$3)" "decimal" nil nil nil nil nil nil)
                       ("ex" "throw new Exception('${1:Message}');" "ex" nil nil nil nil nil nil)
                       ("exb" "{% extends '::base.html.twig' %}\n{% block body %}\n\n{% endblock %}\n" "exb" nil nil nil nil nil nil)
                       ("extends" "{% extends '${1:base.html}' %}" "extends" nil nil nil nil nil nil)
                       ("fore" "" "fore" nil nil nil nil nil nil)
                       ("form" "class ${1:Formname}(forms.Form):\n    \"\"\"${2:($1 description)}\"\"\"\n    ${3:def __init__(self, *args, **kwargs):\n         ${4:}\n         super($1, self).__init__(*args, **kwargs)}\n\n    $0\n\n    ${5:def clean_${6:fieldname}(self):\n         $7\n		return self.cleaned_data['$6']}\n\n    ${8:def clean(self):\n         $9\n         return self.cleaned_data}\n" "form" nil nil nil nil nil nil)
                       ("function" "" "function" nil nil nil nil nil nil)
                       ("gs" "\nprotected $$1;\n\n/*\n * Getter for $1\n */\npublic function get${1:$(capitalize text)}() {\n    return $this->$1;$2\n}\n\n/*\n * Setter for $1\n */\npublic function set${1:$(capitalize text)}($$1) {\n    $this->$1 = $$1;$3\n    return $this;\n}\n$0" "Getter and setter" nil nil nil nil nil nil)
                       ("html5" "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"utf-8\"/>\n    <title>$1</title>\n    <!--\n    <link href=\"css/some-stylesheet.css\" rel=\"stylesheet\"/>\n    <script src=\"scripts/some-script.js\"/>\n    <script>\n    </script>\n    -->\n</head>\n<body>\n    $2\n</body>\n</html>" "html 5 snippet" nil
                        ("default")
                        nil nil nil nil)
                       ("if" "{% else %}" "if" nil nil nil nil nil nil)
                       ("ifchanged" "{% ifchanged $1%}$2{% endifchanged %}" "ifchanged" nil nil nil nil nil nil)
                       ("ife" "" "ife" nil nil nil nil nil nil)
                       ("ifequal" "{% ifequal $1 $2 %}\n	$3\n{% endifequal %}" "ifequal" nil nil nil nil nil nil)
                       ("ifnotequal" "{% ifnotequal $1 $2 %}\n	$3\n{% endifnotequal %}" "ifnotequal" nil nil nil nil nil nil)
                       ("image" "${1:FIELDNAME} = models.ImageField(upload_to=\"${2:/dir/path}\"${3:, height_field=$4}${5:, width_field=$6})" "image" nil nil nil nil nil nil)
                       ("include" "{% include ${1:\"$2\"} %}" "include" nil nil nil nil nil nil)
                       ("integer" "${1:FIELDNAME} = models.IntegerField(${2:blank=True, null=True})" "integer" nil nil nil nil nil nil)
                       ("intermediate" "" "intermediate" nil nil nil nil nil nil)
                       ("ip" "${1:FIELDNAME} = models.IPAddressField(${2:blank=True})" "ip" nil nil nil nil nil nil)
                       ("jqajax" "\\$.ajax({\n  url: '${1:/path/to/file}',\n${2/(.+)/(?1:  type\\: ':)/}${2:POST}${2/(.+)/(?1:',\n:)/}${3/(.+)/(?1:  dataType\\: ':)/}${3:xml/html/script/json/jsonp}${3/(.+)/(?1:',\n:)/}${4/(.+)/(?1:  data\\: {:)/}${4:param1: 'value1'}${4/(.+)/(?1:},\n:)/}${5/(.+)/(?1:  complete\\: function\\(xhr, textStatus\\) {\n    :)/}${5://called when complete}${5/(.+)/(?1:\n  },\n:)/}${6/(.+)/(?1:  success\\: function\\(data, textStatus, xhr\\) {\n    :)/}${6://called when successful}${6/(.+)/(?1:\n  },\n:)/}${7/(.+)/(?1:  error\\: function\\(xhr, textStatus, errorThrown\\) {\n    :)/}${7://called when there is an error}\n${7/(.+)/(?1:  }\n:)/}});\n$0" "jqajax" nil
                        ("jQuery")
                        nil nil nil nil)
                       ("load" "{% load $1 %}" "load" nil nil nil nil nil nil)
                       ("now" "{% now \"$1\" %}" "now" nil nil nil nil nil nil)
                       ("php" "<?php\n/**\n * ${1:file_title}\n *\n * @package   ${2:package}\n * @author    ${3:Jacek Wysocki} <${4:jacek.wysocki@gmail.com}>\n * @copyright Copyright (c) ${5:`(format-time-string \"%Y\" (current-time))`} ${6:copyright}\n */\n\n/**\n * $1\n *\n * ${7:description}\n *\n * @package $2\n * @author  $3 <$4>\n * @copyright Copyright (c) $5 $6\n */\nclass ${8:`(let ((fn (capitalize (file-name-nondirectory\n                                 (file-name-sans-extension\n                 (or (buffer-file-name)\n                     (buffer-name (current-buffer))))))))\n       (replace-regexp-in-string \"_\" \"\" fn)\n       (replace-regexp-in-string \"\\.Class\" \"\" fn)\n       )`} ${9:$$(yas/choose-value '(\" \" \"extends\" \"implements\"))}\n{\n    public function __construct($options=array())\n    {\n        if (is_array($options)) {\n            foreach ($options as $k => $v) {\n                $this->$k = $v;\n            }\n        }\n        $0\n    }\n}\n" "<?php" nil
                        ("definitions")
                        nil nil nil nil)
                       ("pre" "echo \"<PRE>\" . var_export($1, 1) . \"</PRE>\";\n" "pre" nil nil nil nil nil nil)
                       ("pri" "" "pri" nil nil nil nil nil nil)
                       ("pro" "" "pro" nil nil nil nil nil nil)
                       ("pub" "public function ${4:name}($5)\n{\n   $0\n}\n" "public method template" nil
                        ("definitions")
                        nil nil nil nil)
                       ("ready" "\\$(document).ready(function() {\n	${0:// Stuff to do as soon as the DOM is ready;}\n});\n" "ready" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jun  6 08:15:12 2013
