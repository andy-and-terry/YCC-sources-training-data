package main

import (
	"fmt"
	"strings"
)

// farey builds F_n with the next-term recurrence.
func farey(n int) []string {
	out := []string{"0/1"}
	a, b, c, d := 0, 1, 1, n
	for c <= n {
		k := (n + b) / d
		a, b, c, d = c, d, k*c-a, k*d-b
		out = append(out, fmt.Sprintf("%d/%d", a, b))
		if a == 1 && b == 1 {
			break
		}
	}
	return out
}

func main() {
	fmt.Println(strings.Join(farey(5), " "))
}
