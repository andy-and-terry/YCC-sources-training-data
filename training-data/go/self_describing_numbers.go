package main

import (
	"fmt"
	"strconv"
	"strings"
)

func isSelfDescribing(n int) bool {
	s := strconv.Itoa(n)
	for i, ch := range s {
		if strings.Count(s, strconv.Itoa(i)) != int(ch-'0') {
			return false
		}
	}
	return true
}

func main() {
	for _, n := range []int{1210, 2020, 21200, 1211} {
		fmt.Println(n, isSelfDescribing(n))
	}
}
