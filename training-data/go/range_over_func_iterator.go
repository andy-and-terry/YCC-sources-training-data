package main

import (
	"fmt"
	"iter"
)

func Count(n int) iter.Seq[int] {
	return func(yield func(int) bool) {
		for i := 0; i < n; i++ {
			if !yield(i) {
				return
			}
		}
	}
}

func main() {
	for v := range Count(10) {
		if v == 4 {
			break
		}
		fmt.Print(v, " ")
	}
	fmt.Println()
	for i := range 3 {
		fmt.Print(i)
	}
	fmt.Println()
}
