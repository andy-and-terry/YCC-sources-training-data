package main

import (
	"fmt"
	"sort"
)

func main() {
	s := "banana$"
	n := len(s)
	rots := make([]string, n)
	for i := range rots {
		rots[i] = s[i:] + s[:i]
	}
	sort.Strings(rots)
	out := make([]byte, n)
	for i, r := range rots {
		out[i] = r[n-1]
	}
	fmt.Println(string(out))
}
