package main

import "fmt"

func vanEck(count int) []int {
	seq := []int{0}
	lastSeen := map[int]int{}
	for i := 0; i < count-1; i++ {
		cur := seq[i]
		next := 0
		if prev, ok := lastSeen[cur]; ok {
			next = i - prev
		}
		lastSeen[cur] = i
		seq = append(seq, next)
	}
	return seq
}

func main() {
	for _, v := range vanEck(20) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
