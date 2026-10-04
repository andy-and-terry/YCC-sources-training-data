package main

import (
	"os"
	"text/template"
)

type Item struct {
	Name  string
	Price float64
}

const tpl = `Order for {{.Customer}}:
{{range $i, $it := .Items}}{{$i}}. {{$it.Name}} - ${{printf "%.2f" $it.Price}}
{{end}}{{if .Express}}Express shipping requested.{{else}}Standard shipping.{{end}}
`

func main() {
	t := template.Must(template.New("order").Parse(tpl))
	data := map[string]any{
		"Customer": "Alice",
		"Items":    []Item{{"Keyboard", 49.9}, {"Mouse", 19.5}},
		"Express":  true,
	}
	if err := t.Execute(os.Stdout, data); err != nil {
		panic(err)
	}
}
