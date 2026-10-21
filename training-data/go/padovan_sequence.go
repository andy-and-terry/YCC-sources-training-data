package main

import "fmt"

// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
func padovan(count int) []int {
	p := make([]int, count)
	for i := range p {
		if i < 3 {
			p[i] = 1
		} else {
			p[i] = p[i-2] + p[i-3]
		}
	}
	return p
}

func main() {
	fmt.Println(padovan(15))
}
