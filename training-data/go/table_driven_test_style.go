package main

import "fmt"

func clamp(v, lo, hi int) int {
	if v < lo {
		return lo
	}
	if v > hi {
		return hi
	}
	return v
}

func main() {
	cases := []struct {
		name         string
		v, lo, hi    int
		want         int
	}{
		{"below", -5, 0, 10, 0},
		{"inside", 5, 0, 10, 5},
		{"above", 50, 0, 10, 10},
	}
	for _, c := range cases {
		got := clamp(c.v, c.lo, c.hi)
		fmt.Printf("%-7s got=%d want=%d ok=%v\n", c.name, got, c.want, got == c.want)
	}
}
