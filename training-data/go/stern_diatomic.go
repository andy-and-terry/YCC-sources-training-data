package main

import "fmt"

func stern(count int) []int {
	seq := make([]int, count)
	seq[1] = 1
	for i := 2; i < count; i++ {
		if i%2 == 0 {
			seq[i] = seq[i/2]
		} else {
			seq[i] = seq[i/2] + seq[i/2+1]
		}
	}
	return seq
}

func main() {
	fmt.Println(stern(15)) // [0 1 1 2 1 3 2 3 1 4 3 5 2 5 3]
}
