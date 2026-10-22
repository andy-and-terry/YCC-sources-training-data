package main

import (
	"fmt"
	"strings"
)

func kolakoski(count int) []int {
	seq := []int{1, 2, 2}
	for i := 2; len(seq) < count; i++ {
		value := 3 - seq[len(seq)-1]
		for k := 0; k < seq[i]; k++ {
			seq = append(seq, value)
		}
	}
	return seq[:count]
}

func main() {
	parts := []string{}
	for _, v := range kolakoski(20) {
		parts = append(parts, fmt.Sprint(v))
	}
	fmt.Println(strings.Join(parts, " "))
}
