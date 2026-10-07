package main

import (
	"fmt"
	"strconv"
	"strings"
)

func nextTerm(s string) string {
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
	return b.String()
}

func main() {
	s := "1"
	for i := 0; i < 8; i++ {
		fmt.Println(s)
		s = nextTerm(s)
	}
}
