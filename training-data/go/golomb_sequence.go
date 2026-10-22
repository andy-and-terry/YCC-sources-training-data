package main

import "fmt"

// a(n) = 1 + a(n - a(a(n-1))), 1-based indexing
func golomb(count int) []int {
	a := make([]int, count+1)
	a[1] = 1
	for n := 2; n <= count; n++ {
		a[n] = 1 + a[n-a[a[n-1]]]
	}
	return a[1:]
}

func main() {
	for _, v := range golomb(20) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
