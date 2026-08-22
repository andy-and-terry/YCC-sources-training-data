package main

import (
	"fmt"
	"sort"
)

func bucketSort(items []float64, bucketCount int) []float64 {
	if len(items) == 0 {
		return items
	}
	lo, hi := items[0], items[0]
	for _, x := range items {
		if x < lo {
			lo = x
		}
		if x > hi {
			hi = x
		}
	}
	span := hi - lo
	if span == 0 {
		span = 1
	}
	buckets := make([][]float64, bucketCount)
	for _, x := range items {
		idx := int((x - lo) / span * float64(bucketCount))
		if idx >= bucketCount {
			idx = bucketCount - 1
		}
		buckets[idx] = append(buckets[idx], x)
	}
	var result []float64
	for _, bucket := range buckets {
		sort.Float64s(bucket)
		result = append(result, bucket...)
	}
	return result
}

func main() {
	fmt.Println(bucketSort([]float64{0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51}, 10))
}
