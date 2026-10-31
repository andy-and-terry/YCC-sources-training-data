package main

import "fmt"

var fact = [10]int{1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880}

func isFactorion(n int) bool {
	sum := 0
	for m := n; m > 0; m /= 10 {
		sum += fact[m%10]
	}
	return sum == n
}

func main() {
	var found []int
	for n := 1; n < 50000; n++ {
		if isFactorion(n) {
			found = append(found, n)
		}
	}
	fmt.Println(found)
}
