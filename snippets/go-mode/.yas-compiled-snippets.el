;;; Compiled snippets and support files for `go-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'go-mode
                     '(("www" "package main\n\nimport (\n    \"fmt\"\n    \"net/http\"\n)\n\nfunc handler(w http.ResponseWriter, r *http.Request) {\n    fmt.Fprintf(w, \"Hi there, I love %s!\", r.URL.Path[1:])\n}\n\nfunc main() {\n    http.HandleFunc(\"/\", handler)\n    http.ListenAndServe(\":8080\", nil)\n}" "www" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/www" nil nil)
                       ("writer" "type $1 struct{}\n\nfunc (writer *$1) Write(p []byte) (n int, err error) {\n	$0\n	return len(p), nil\n}\n" "writer" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/writer" nil nil)
                       ("ttpl" "package ${1:main}\n\nimport(\n    \"testing\"\n)\n\n\nfunc Test${2Function}(t *testing.T) {\n     $0\n}\n" "ttpl" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/ttpl" nil nil)
                       ("tpl" "package ${1:main}\n\nimport (\n	\"fmt\"\n)\n\nfunc main() {\n  $0\n}" "tpl" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/tpl" nil nil)
                       ("timer" "defer func(begin time.Time) {\n	fmt.Println(\"Function call took: \", time.Since(begin))\n}(time.Now())\n" "timer" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/timer" nil nil)
                       ("tests" "tests := []struct {\n	expected\n}{\n	{},\n}\n\nfor n, tt := range tests {\n	actual := \n	if tt.expected != actual {\n		t.Errorf(\"#%d want %v, got %v\", n, tt.expected, actual)\n	}\n}\n" "tests" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/tests" nil nil)
                       ("test" "func Test$1(t *testing.T) {\n	$0\n}\n" "test" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/test" nil nil)
                       ("switch" "switch $1 {\n	case $2:\n		$0\n	default:\n}" "for switch" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/switch" nil nil)
                       ("struct" "type ${1:name} struct {\n	 $0\n}" "type Name struct { ... }" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/struct" nil nil)
                       ("sqlnull" "$1, _ := $2.Value()\nif $1 != nil {\n	$3 = $1.(string)\n}\n" "sqlnull" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/go-mode/sqlnull" nil nil)
                       ("r" "for ${1:_}, ${2:value} := range ${3} {\n    $0\n}\n" "range" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/range" nil nil)
                       ("pr" "fmt.Println($1)" "print" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/printf" nil nil)
                       ("pp" "fmt.Println($1)$0" "printline" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/pp" nil nil)
                       ("pack" "// \npackage ${1:main}\n" "package" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/package" nil nil)
                       ("m" "func (${1:obj} *${2:Struct}) ${3:method}($4) $5 {\n    `yas/selected-text`$0\n}\n" "func name(this Struct) (return) { ... }" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/method" nil nil)
                       ("map" "var ${1:name} = map[${2:string}] ${3:type}{\n    $0\n}" "var name = map[type] type{ }" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/map" nil nil)
                       ("main" "func main() {\n	$0\n}\n" "func main" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/main" nil nil)
                       ("l" "log.Println($1)$0" "printline" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/l" nil nil)
                       ("i" "type ${1:name} interface {\n	 $0\n}" "type Name interface" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/interface" nil nil)
                       ("init" "func init(){\n	$0\n}\n" "init" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/init" nil nil)
                       ("import" "import (\n	\"$0\"\n)\n" "import" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/import" nil nil)
                       ("ife" "if ${1:condition} {\n   `yas/selected-text`$2\n} else {\n    $0\n}\n" "if condition {...} else {...}" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/ifelse" nil nil)
                       ("if" "if ${1:condition} {\n    `yas/selected-text`$0\n}\n\n" "if condition {...}" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/if" nil nil)
                       ("func" "func $1($2) $3 {\n    `yas/selected-text`$0\n}" "func name() (return) { ... }" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/function" nil nil)
                       ("fori" "for i := 0; i < $1; i++{\n	$0\n}" "for0" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/for0" nil nil)
                       ("for" "for $1{\n	$0\n}" "for" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/for" nil nil)
                       ("example" "func Example$1() {\n	$0\n}\n" "example" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/example" nil nil)
                       ("err" "if err != nil {\n	$0\n}" "error" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/error" nil nil)
                       ("echo" "package main\n\nimport (\n	\"net/http\"\n\n	\"github.com/labstack/echo\"\n	mw \"github.com/labstack/echo/middleware\"\n)\n\n// Handler\nfunc hello(c *echo.Context) error {\n	return c.String(http.StatusOK, \"Hello, World!\\n\")\n}\n\nfunc main() {\n	// Echo instance\n	e := echo.New()\n\n	// Middleware\n	e.Use(mw.Logger())\n	e.Use(mw.Recover())\n\n	// Routes\n	e.Get(\"/\", hello)\n\n	// Start server\n	e.Run(\":1323\")\n}\n" "echo www server" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/echo" nil nil)
                       ("d" "fmt.Printf(\"%+v\", $1)" "printf debug" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/d" nil nil)
                       ("new" "// New$1 returns a new $1.\nfunc New$1() *$1 {\n	return &$1{$0}\n}\n" "new pseudo constructor" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/constructor" nil nil)
                       ("case" "case ${1:condition}:\n    $0\n" "case" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/case" nil nil)
                       ("bench" "func Benchmark$1(b *testing.B) {\n	for i := 0; i < b.N; i++ {\n		$0\n	}\n}\n" "benchmark" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/benchmark" nil nil)
                       ("array" "${1:name} := [...]${2:type}{${3:values}}\n$0" "array := [...]type{values}" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        "/home/exu/.emacs.d/snippets/go-mode/array" nil nil)
                       ("append" "$1 = append($1, $0)" "for append" nil nil nil "/home/exu/.emacs.d/snippets/go-mode/append" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016
