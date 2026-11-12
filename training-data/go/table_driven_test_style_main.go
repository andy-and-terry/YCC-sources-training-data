package main

import "fmt"

func abs(n int) int {
	if n < 0 {
		return -n
	}
	return n
}

func main() {
	cases := []struct{ in, want int }{{-3, 3}, {0, 0}, {5, 5}}
	for _, c := range cases {
		fmt.Println(c.in, abs(c.in) == c.want)
	}
}
