package main

import "fmt"

func main() {
	const n = 50
	composite := make([]bool, n+1)
	for i := 2; i*i <= n; i++ {
		if !composite[i] {
			for j := i * i; j <= n; j += i {
				composite[j] = true
			}
		}
	}
	for p := 3; p+2 <= n; p++ {
		if !composite[p] && !composite[p+2] {
			fmt.Printf("(%d, %d) ", p, p+2)
		}
	}
	fmt.Println()
}
