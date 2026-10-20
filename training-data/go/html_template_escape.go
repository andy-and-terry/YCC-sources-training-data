package main

import (
	"html/template"
	"os"
)

func main() {
	t := template.Must(template.New("page").Parse(
		`<a href="/q?x={{.Query}}" title="{{.Title}}">{{.Title}}</a>` + "\n"))
	_ = t.Execute(os.Stdout, map[string]string{
		"Query": "a b&c",
		"Title": `<script>alert("x")</script>`,
	})
}
