package main

import "fmt"

// Greedy sequence whose pairwise sums are all distinct.
func main() {
	seq := []int{}
	sums := map[int]bool{}
	for cand := 1; len(seq) < 8; cand++ {
		fresh := map[int]bool{}
		ok := true
		for _, x := range append(append([]int{}, seq...), cand) {
			s := x + cand
			if sums[s] || fresh[s] {
				ok = false
				break
			}
			fresh[s] = true
		}
		if ok {
			seq = append(seq, cand)
			for s := range fresh {
				sums[s] = true
			}
		}
	}
	fmt.Println(seq)
}
