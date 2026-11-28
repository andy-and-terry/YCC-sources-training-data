package main

import (
	"fmt"
	"strings"
)

func main() {
	n := 8
	for r := 0; r < n; r++ {
		fmt.Print(strings.Repeat(" ", n-r-1))
		for c := 0; c <= r; c++ {
			if r&c == c {
				fmt.Print("* ")
			} else {
				fmt.Print("  ")
			}
		}
		fmt.Println()
	}
}
