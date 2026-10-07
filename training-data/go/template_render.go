package main

import (
	"os"
	"strings"
	"text/template"
)

type user struct {
	Name  string
	Items []string
}

func main() {
	funcs := template.FuncMap{"upper": strings.ToUpper, "join": strings.Join}
	tpl := template.Must(template.New("greet").Funcs(funcs).Parse(
		`Hello {{.Name | upper}}, you have {{len .Items}} items{{if .Items}}: {{join .Items ", "}}{{end}}.
{{range $i, $it := .Items}}  {{$i}}. {{$it}}
{{end}}`))
	for _, u := range []user{{"ada", []string{"notebook", "pen"}}, {"bob", nil}} {
		if err := tpl.Execute(os.Stdout, u); err != nil {
			panic(err)
		}
	}
}
