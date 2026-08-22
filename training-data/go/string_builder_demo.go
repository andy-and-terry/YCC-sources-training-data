package main

import (
	"fmt"
	"strings"
)

func buildCSVLine(fields []string) string {
	var sb strings.Builder
	for i, field := range fields {
		if i > 0 {
			sb.WriteByte(',')
		}
		sb.WriteString(field)
	}
	return sb.String()
}

func main() {
	fmt.Println(buildCSVLine([]string{"a", "b", "c"}))
}
