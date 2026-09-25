package main

import (
	"fmt"
	"strings"
)

func wrap(text string, width int) []string {
	var lines []string
	var line strings.Builder
	for _, w := range strings.Fields(text) {
		for len(w) > width {
			if line.Len() > 0 {
				lines = append(lines, line.String())
				line.Reset()
			}
			lines = append(lines, w[:width])
			w = w[width:]
		}
		switch {
		case line.Len() == 0:
			line.WriteString(w)
		case line.Len()+1+len(w) <= width:
			line.WriteByte(' ')
			line.WriteString(w)
		default:
			lines = append(lines, line.String())
			line.Reset()
			line.WriteString(w)
		}
	}
	if line.Len() > 0 {
		lines = append(lines, line.String())
	}
	return lines
}

func main() {
	text := "The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically"
	for _, l := range wrap(text, 16) {
		fmt.Printf("|%-16s|\n", l)
	}
}
