// Integer (1..3999) to Roman numeral using a greedy table.
package main

import (
	"fmt"
	"strings"
)

var table = []struct {
	value  int
	symbol string
}{
	{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"},
	{50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"},
}

func toRoman(n int) string {
	var sb strings.Builder
	for _, t := range table {
		for n >= t.value {
			sb.WriteString(t.symbol)
			n -= t.value
		}
	}
	return sb.String()
}

func main() {
	fmt.Println(toRoman(1994), toRoman(58))
}
