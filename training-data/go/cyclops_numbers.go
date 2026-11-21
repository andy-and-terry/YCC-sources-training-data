package main

import (
	"fmt"
	"strconv"
	"strings"
)

// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
func isCyclops(n int) bool {
	s := strconv.Itoa(n)
	return len(s)%2 == 1 && s[len(s)/2] == '0' && strings.Count(s, "0") == 1
}

func main() {
	count := 0
	for n := 1; n < 100000; n++ {
		if isCyclops(n) {
			count++
		}
	}
	fmt.Println(count)
}
