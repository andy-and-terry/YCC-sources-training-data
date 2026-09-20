package main

import "fmt"

// GoF Template Method pattern: the algorithm's skeleton (Run) is fixed, and
// each step that varies is supplied by an implementation of DataExporter.
// Go has no inheritance, so the "template" lives in a plain function that
// takes the interface, rather than in a base class with overridable hooks.
type DataExporter interface {
	FetchData() []string
	FormatRow(row string) string
	Footer() string
}

func Run(exporter DataExporter) string {
	output := ""
	for _, row := range exporter.FetchData() {
		output += exporter.FormatRow(row)
	}
	output += exporter.Footer()
	return output
}

type CSVExporter struct{}

func (CSVExporter) FetchData() []string { return []string{"a", "b", "c"} }
func (CSVExporter) FormatRow(row string) string {
	return row + ","
}
func (CSVExporter) Footer() string { return "\n" }

type HTMLExporter struct{}

func (HTMLExporter) FetchData() []string { return []string{"a", "b", "c"} }
func (HTMLExporter) FormatRow(row string) string {
	return "<li>" + row + "</li>"
}
func (HTMLExporter) Footer() string { return "" }

func main() {
	fmt.Print(Run(CSVExporter{}))
	fmt.Println(Run(HTMLExporter{}))
}
