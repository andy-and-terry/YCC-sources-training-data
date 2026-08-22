package main

import "fmt"

func fit(xs, ys []float64) (float64, float64) {
	n := float64(len(xs))
	meanX, meanY := 0.0, 0.0
	for i := range xs {
		meanX += xs[i]
		meanY += ys[i]
	}
	meanX /= n
	meanY /= n

	numerator, denominator := 0.0, 0.0
	for i := range xs {
		numerator += (xs[i] - meanX) * (ys[i] - meanY)
		denominator += (xs[i] - meanX) * (xs[i] - meanX)
	}
	slope := numerator / denominator
	intercept := meanY - slope*meanX
	return slope, intercept
}

func predict(slope, intercept, x float64) float64 {
	return slope*x + intercept
}

func main() {
	xs := []float64{1, 2, 3, 4, 5}
	ys := []float64{2, 4, 5, 4, 5}
	slope, intercept := fit(xs, ys)
	fmt.Printf("y = %.2fx + %.2f\n", slope, intercept)
	fmt.Println(predict(slope, intercept, 6))
}
