package main

import "fmt"

type romanValue struct {
	value  int
	symbol string
}

var romanValues = []romanValue{
	{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
	{100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"},
	{10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"},
}

func toRoman(n int) string {
	result := ""
	for _, rv := range romanValues {
		for n >= rv.value {
			result += rv.symbol
			n -= rv.value
		}
	}
	return result
}

func fromRoman(s string) int {
	values := map[byte]int{'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
	total := 0
	for i := 0; i < len(s); i++ {
		value := values[s[i]]
		if i+1 < len(s) && values[s[i+1]] > value {
			total -= value
		} else {
			total += value
		}
	}
	return total
}

func main() {
	fmt.Println(toRoman(1994))
	fmt.Println(fromRoman("MCMXCIV"))
}
