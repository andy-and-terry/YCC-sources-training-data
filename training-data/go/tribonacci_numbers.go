package main

import "fmt"

// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
func tribonacci(count int) []int {
	t := []int{0, 0, 1}
	for len(t) < count {
		n := len(t)
		t = append(t, t[n-1]+t[n-2]+t[n-3])
	}
	return t[:count]
}

func main() {
	fmt.Println("Tribonacci:", tribonacci(15))
}
