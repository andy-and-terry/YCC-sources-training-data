package main

import (
	"errors"
	"fmt"
	"math"
)

var errNoConverge = errors.New("newton: did not converge")

func newton(f, df func(float64) float64, x0, tol float64, maxIter int) (float64, int, error) {
	x := x0
	for i := 1; i <= maxIter; i++ {
		d := df(x)
		if d == 0 {
			return x, i, errNoConverge
		}
		next := x - f(x)/d
		if math.Abs(next-x) < tol {
			return next, i, nil
		}
		x = next
	}
	return x, maxIter, errNoConverge
}

func main() {
	for _, a := range []float64{2, 9, 0.25, 1e10} {
		r, it, _ := newton(func(x float64) float64 { return x*x - a }, func(x float64) float64 { return 2 * x }, math.Max(a, 1), 1e-12, 100)
		fmt.Printf("sqrt(%g) = %.12f (%d iters, math.Sqrt %.12f)\n", a, r, it, math.Sqrt(a))
	}
	_, _, err := newton(func(x float64) float64 { return x*x + 1 }, func(x float64) float64 { return 2 * x }, 0, 1e-12, 50)
	fmt.Println("x^2+1:", err)
}
