package main

import "fmt"

func maxProduct(a []int) int {
	best, hi, lo := a[0], a[0], a[0]
	for _, x := range a[1:] {
		if x < 0 {
			hi, lo = lo, hi
		}
		hi = max(x, hi*x)
		lo = min(x, lo*x)
		best = max(best, hi)
	}
	return best
}

func main() {
	fmt.Println(maxProduct([]int{2, 3, -2, 4}), maxProduct([]int{-2, 0, -1}), maxProduct([]int{-2, 3, -4}), maxProduct([]int{1, -2, -3, 0, 7, -8, -2}))
}
