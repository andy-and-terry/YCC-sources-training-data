package main

import (
	"fmt"
	"math/rand"
)

func reservoirSample(stream []int, k int, r *rand.Rand) []int {
	sample := make([]int, 0, k)
	for i, v := range stream {
		if i < k {
			sample = append(sample, v)
			continue
		}
		j := r.Intn(i + 1)
		if j < k {
			sample[j] = v
		}
	}
	return sample
}

func main() {
	r := rand.New(rand.NewSource(7))

	stream := make([]int, 100)
	for i := range stream {
		stream[i] = i + 1
	}

	sample := reservoirSample(stream, 5, r)
	fmt.Println(sample)
	fmt.Println("sample size:", len(sample))
}
