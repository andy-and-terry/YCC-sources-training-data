package main

import "fmt"

// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
func main() {
	n := []int{1, 1, 1}
	for i := 3; i < 15; i++ {
		n = append(n, n[i-1]+n[i-3])
	}
	fmt.Println(n)
}
