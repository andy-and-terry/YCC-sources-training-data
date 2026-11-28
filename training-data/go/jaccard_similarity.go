package main

import "fmt"

func jaccard(a, b []int) float64 {
	set := map[int]bool{}
	for _, x := range a {
		set[x] = true
	}
	inter, union := 0, len(set)
	seen := map[int]bool{}
	for _, x := range b {
		if seen[x] {
			continue
		}
		seen[x] = true
		if set[x] {
			inter++
		} else {
			union++
		}
	}
	if union == 0 {
		return 1
	}
	return float64(inter) / float64(union)
}

func main() {
	fmt.Println(jaccard([]int{1, 2, 3, 4}, []int{3, 4, 5}))
}
