package main

import (
	"fmt"
	"strings"
	"unicode"
)

func luhnSum(digits string) int {
	sum, double := 0, false
	for i := len(digits) - 1; i >= 0; i-- {
		d := int(digits[i] - '0')
		if double {
			if d *= 2; d > 9 {
				d -= 9
			}
		}
		sum += d
		double = !double
	}
	return sum
}

func luhnValid(s string) bool {
	s = strings.ReplaceAll(s, " ", "")
	if len(s) < 2 {
		return false
	}
	for _, r := range s {
		if !unicode.IsDigit(r) {
			return false
		}
	}
	return luhnSum(s)%10 == 0
}

func checkDigit(partial string) int { return (10 - luhnSum(partial+"0")%10) % 10 }

func main() {
	fmt.Println(luhnValid("4539 3195 0343 6467"), luhnValid("8273 1232 7352 0569"), luhnValid("12a4"))
	fmt.Println("check digit for 7992739871:", checkDigit("7992739871"))
}
