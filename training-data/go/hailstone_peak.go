// Highest value reached by the Collatz (hailstone) sequence from n.
package main

import "fmt"

func peak(n int) int {
	best := n
	for n != 1 {
		if n%2 == 0 {
			n /= 2
		} else {
			n = 3*n + 1
		}
		best = max(best, n)
	}
	return best
}

func main() {
	fmt.Println(peak(27))
}
