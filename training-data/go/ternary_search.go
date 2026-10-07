package main

import (
	"fmt"
	"math"
)

func ternarySearch(a []int, target int) int {
	lo, hi := 0, len(a)-1
	for lo <= hi {
		m1, m2 := lo+(hi-lo)/3, hi-(hi-lo)/3
		switch {
		case a[m1] == target:
			return m1
		case a[m2] == target:
			return m2
		case target < a[m1]:
			hi = m1 - 1
		case target > a[m2]:
			lo = m2 + 1
		default:
			lo, hi = m1+1, m2-1
		}
	}
	return -1
}

func argmax(f func(float64) float64, lo, hi float64) float64 {
	for i := 0; i < 200; i++ {
		m1, m2 := lo+(hi-lo)/3, hi-(hi-lo)/3
		if f(m1) < f(m2) {
			lo = m1
		} else {
			hi = m2
		}
	}
	return (lo + hi) / 2
}

func main() {
	fmt.Println(ternarySearch([]int{1, 3, 5, 7, 9, 11, 13}, 9))
	fmt.Printf("%.6f %.6f\n", argmax(func(x float64) float64 { return -(x-2)*(x-2) + 3 }, -10, 10), argmax(math.Sin, 0, 3))
}
