package main

import (
	"fmt"
	"math"
)

func cosine(a, b []float64) float64 {
	var dot, na, nb float64
	for i := range a {
		dot += a[i] * b[i]
		na += a[i] * a[i]
		nb += b[i] * b[i]
	}
	if na == 0 || nb == 0 {
		return 0
	}
	return dot / (math.Sqrt(na) * math.Sqrt(nb))
}

func main() {
	fmt.Printf("%.4f\n", cosine([]float64{1, 2, 3}, []float64{4, 5, 6}))
}
