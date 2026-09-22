package main

import "fmt"

type modernPrinter interface {
	print(text string) string
}

type legacyPrinter struct{}

func (legacyPrinter) printLegacy(text string) string {
	return "[legacy] " + text
}

type legacyPrinterAdapter struct {
	legacy legacyPrinter
}

func (a legacyPrinterAdapter) print(text string) string {
	return a.legacy.printLegacy(text)
}

func render(p modernPrinter, text string) string {
	return p.print(text)
}

func main() {
	adapter := legacyPrinterAdapter{legacy: legacyPrinter{}}
	fmt.Println(render(adapter, "hello"))
}
