package main

import (
	"os"
	"strings"
	"text/template"
)

type Item struct {
	Name  string
	Price float64
}

func main() {
	funcs := template.FuncMap{"upper": strings.ToUpper}
	t := template.Must(template.New("inv").Funcs(funcs).Parse(
		`Customer: {{.Customer | upper}}
{{range $i, $it := .Items}}{{$i}}. {{$it.Name}} ${{printf "%.2f" $it.Price}}
{{else}}no items
{{end}}`))
	data := map[string]any{
		"Customer": "ann",
		"Items":    []Item{{"Pen", 1.5}, {"Book", 12}},
	}
	if err := t.Execute(os.Stdout, data); err != nil {
		panic(err)
	}
}
