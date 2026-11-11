// Amicable pairs: d(a) == b and d(b) == a with a != b.
package main

import "fmt"

func d(n int) int {
	s := 0
	for i := 1; i < n; i++ {
		if n%i == 0 {
			s += i
		}
	}
	return s
}

func main() {
	for a := 2; a < 1500; a++ {
		if b := d(a); b > a && d(b) == a {
			fmt.Println(a, b)
		}
	}
}
