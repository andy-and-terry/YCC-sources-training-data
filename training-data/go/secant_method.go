package main

import "fmt"

func secant(f func(float64) float64, a, b float64) float64 {
	for i := 0; i < 40; i++ {
		fa, fb := f(a), f(b)
		if fa == fb {
			break
		}
		a, b = b, b-fb*(b-a)/(fb-fa)
	}
	return b
}

func main() {
	fmt.Printf("%.8f\n", secant(func(x float64) float64 { return x*x - 2 }, 1, 2))
}
