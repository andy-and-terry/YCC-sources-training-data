package main

import "fmt"

// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
func main() {
	p := []int{3, 0, 2}
	for n := 3; n < 15; n++ {
		p = append(p, p[n-2]+p[n-3])
	}
	fmt.Println(p)
}
