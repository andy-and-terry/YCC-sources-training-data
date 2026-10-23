package main

import "fmt"

// Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), Q(1) = Q(2) = 1
func hofstadterQ(count int) []int {
	q := make([]int, count+1)
	q[1], q[2] = 1, 1
	for n := 3; n <= count; n++ {
		q[n] = q[n-q[n-1]] + q[n-q[n-2]]
	}
	return q[1:]
}

func main() {
	for _, v := range hofstadterQ(20) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
