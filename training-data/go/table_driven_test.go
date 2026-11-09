package main

import "testing"

func Abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func TestAbs(t *testing.T) {
	cases := []struct{ in, want int }{{-3, 3}, {0, 0}, {5, 5}}
	for _, c := range cases {
		if got := Abs(c.in); got != c.want {
			t.Errorf("Abs(%d)=%d want %d", c.in, got, c.want)
		}
	}
}
