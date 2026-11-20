package main

import "fmt"

func aliquot(n int) int {
	s := 0
	for d := 1; d < n; d++ {
		if n%d == 0 {
			s += d
		}
	}
	return s
}

func main() {
	for _, n := range []int{6, 12, 15, 28} {
		a := aliquot(n)
		kind := "deficient"
		switch {
		case a == n:
			kind = "perfect"
		case a > n:
			kind = "abundant"
		}
		fmt.Println(n, a, kind)
	}
}
