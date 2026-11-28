package main

import (
	"fmt"
	"math"
)

func secant(f func(float64) float64, x0, x1 float64) float64 {
	for i := 0; i < 50; i++ {
		f0, f1 := f(x0), f(x1)
		if f1 == f0 {
			break
		}
		x0, x1 = x1, x1-f1*(x1-x0)/(f1-f0)
		if math.Abs(x1-x0) < 1e-12 {
			break
		}
	}
	return x1
}

func main() {
	fmt.Println(secant(func(x float64) float64 { return x*x - 2 }, 1, 2))
}
