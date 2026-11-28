package main

import "fmt"

var fact = [10]int{1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880}

func isFactorion(n int) bool {
	s := 0
	for m := n; m > 0; m /= 10 {
		s += fact[m%10]
	}
	return s == n
}

func main() {
	for n := 1; n < 50000; n++ {
		if isFactorion(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println() // 1 2 145 40585
}
