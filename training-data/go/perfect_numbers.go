package main

import "fmt"

func aliquotSum(n int) int {
	if n == 1 {
		return 0
	}
	sum := 1
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			sum += i
			if i != n/i {
				sum += n / i
			}
		}
	}
	return sum
}

func classify(n int) string {
	switch s := aliquotSum(n); {
	case s == n:
		return "perfect"
	case s > n:
		return "abundant"
	default:
		return "deficient"
	}
}

func main() {
	for _, n := range []int{6, 12, 28, 13, 8128} {
		fmt.Println(n, classify(n))
	}
}
