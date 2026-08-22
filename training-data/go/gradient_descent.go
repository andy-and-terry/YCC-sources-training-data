package main

import "fmt"

func gradientDescent(gradFn func(float64) float64, start, learningRate float64, iterations int) float64 {
	x := start
	for i := 0; i < iterations; i++ {
		x -= learningRate * gradFn(x)
	}
	return x
}

func main() {
	minimum := gradientDescent(func(x float64) float64 { return 2 * (x - 3) }, 0, 0.1, 50)
	fmt.Printf("%.4f\n", minimum)
}
