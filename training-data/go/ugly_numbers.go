package main

import "fmt"

func min3(a, b, c int) int {
	m := a
	if b < m {
		m = b
	}
	if c < m {
		m = c
	}
	return m
}

func nthUgly(n int) int {
	u := make([]int, 1, n)
	u[0] = 1
	i2, i3, i5 := 0, 0, 0
	for len(u) < n {
		nx := min3(u[i2]*2, u[i3]*3, u[i5]*5)
		u = append(u, nx)
		if nx == u[i2]*2 {
			i2++
		}
		if nx == u[i3]*3 {
			i3++
		}
		if nx == u[i5]*5 {
			i5++
		}
	}
	return u[n-1]
}

func main() {
	for k := 1; k <= 15; k++ {
		fmt.Print(nthUgly(k), " ")
	}
	fmt.Println()
}
