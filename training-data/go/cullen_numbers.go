package main

import (
	"fmt"
	"strings"
)

func main() {
	var parts []string
	for n := int64(0); n < 10; n++ {
		parts = append(parts, fmt.Sprint(n*(int64(1)<<n)+1))
	}
	fmt.Println(strings.Join(parts, " "))
}
