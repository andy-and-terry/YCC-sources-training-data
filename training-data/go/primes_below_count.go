package main

import "fmt"

func countPrimesBelow(n int) int {
	if n < 3 {
		return 0
	}
	composite := make([]bool, n)
	count := 0
	for i := 2; i < n; i++ {
		if composite[i] {
			continue
		}
		count++
		for j := i * i; j < n; j += i {
			composite[j] = true
		}
	}
	return count
}

func main() {
	fmt.Println(countPrimesBelow(100))
}
