package main

import (
	"fmt"
	"strconv"
	"strings"
)

func countAndSay(n int) string {
	s := "1"
	for k := 1; k < n; k++ {
		var b strings.Builder
		for i := 0; i < len(s); {
			j := i
			for j < len(s) && s[j] == s[i] {
				j++
			}
			b.WriteString(strconv.Itoa(j - i))
			b.WriteByte(s[i])
			i = j
		}
		s = b.String()
	}
	return s
}

func main() {
	for i := 1; i <= 10; i++ {
		fmt.Println(i, countAndSay(i))
	}
	// Conway's constant: consecutive length ratio approaches ~1.3036
	fmt.Printf("ratio: %.4f\n", float64(len(countAndSay(50)))/float64(len(countAndSay(49))))
}
