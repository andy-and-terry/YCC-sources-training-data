package main

import "fmt"

func kolakoski(count int) []int {
	seq := []int{1, 2, 2}
	for i := 2; len(seq) < count; i++ {
		value := 2
		if seq[len(seq)-1] == 2 {
			value = 1
		}
		for k := 0; k < seq[i]; k++ {
			seq = append(seq, value)
		}
	}
	return seq[:count]
}

func main() {
	for _, v := range kolakoski(20) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
