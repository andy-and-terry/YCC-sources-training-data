package main

import (
	"fmt"
	"math"
	"sort"
)

func mean(values []float64) float64 {
	sum := 0.0
	for _, v := range values {
		sum += v
	}
	return sum / float64(len(values))
}

func median(values []float64) float64 {
	sorted := append([]float64(nil), values...)
	sort.Float64s(sorted)
	n := len(sorted)
	mid := n / 2
	if n%2 == 0 {
		return (sorted[mid-1] + sorted[mid]) / 2
	}
	return sorted[mid]
}

func variance(values []float64) float64 {
	m := mean(values)
	sum := 0.0
	for _, v := range values {
		sum += (v - m) * (v - m)
	}
	return sum / float64(len(values))
}

func stdev(values []float64) float64 {
	return math.Sqrt(variance(values))
}

func main() {
	data := []float64{2, 4, 4, 4, 5, 5, 7, 9}
	fmt.Println(mean(data), median(data), stdev(data))
}
