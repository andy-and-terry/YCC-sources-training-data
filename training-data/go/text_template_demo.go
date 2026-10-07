package main

import (
	"os"
	"text/template"
)

type Item struct {
	Name  string
	Price float64
}

func main() {
	const tpl = `Order for {{.Customer}}:
{{range $i, $it := .Items}}{{$i}}. {{$it.Name}} - ${{printf "%.2f" $it.Price}}
{{end}}{{if gt (len .Items) 1}}Multiple items{{else}}Single item{{end}}
`
	t := template.Must(template.New("order").Parse(tpl))
	data := map[string]any{
		"Customer": "Alice",
		"Items":    []Item{{"Pen", 1.5}, {"Book", 12}},
	}
	if err := t.Execute(os.Stdout, data); err != nil {
		panic(err)
	}
}
