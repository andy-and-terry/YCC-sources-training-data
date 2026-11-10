package main

import "fmt"

func main() {
	const limit = 80
	composite := make([]bool, limit+1)
	for i := 2; i*i <= limit; i++ {
		if !composite[i] {
			for j := i * i; j <= limit; j += i {
				composite[j] = true
			}
		}
	}
	for p := 3; p+2 <= limit; p++ {
		if !composite[p] && !composite[p+2] {
			fmt.Printf("(%d,%d) ", p, p+2)
		}
	}
	fmt.Println() // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
