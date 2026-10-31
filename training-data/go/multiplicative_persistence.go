package main

import "fmt"

func persistence(n int) int {
	steps := 0
	for n >= 10 {
		product := 1
		for ; n > 0; n /= 10 {
			product *= n % 10
		}
		n = product
		steps++
	}
	return steps
}

func main() {
	for _, n := range []int{39, 77, 999, 10} {
		fmt.Println(n, persistence(n))
	}
}
