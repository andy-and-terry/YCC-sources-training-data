package main

import (
	"fmt"
	"strings"
)

func zeckendorf(n int) []string {
	fibs := []int{1, 2}
	for fibs[len(fibs)-1] <= n {
		fibs = append(fibs, fibs[len(fibs)-1]+fibs[len(fibs)-2])
	}
	var parts []string
	for i := len(fibs) - 1; i >= 0; i-- {
		if fibs[i] <= n {
			parts = append(parts, fmt.Sprint(fibs[i]))
			n -= fibs[i]
		}
	}
	return parts
}

func main() {
	fmt.Println(strings.Join(zeckendorf(100), " "))
}
