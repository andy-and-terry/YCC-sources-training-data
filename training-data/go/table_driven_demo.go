package main

import "fmt"

func classify(n int) string {
	switch {
	case n < 0:
		return "negative"
	case n == 0:
		return "zero"
	case n%2 == 0:
		return "even"
	default:
		return "odd"
	}
}

func main() {
	cases := []struct {
		name  string
		input int
		want  string
	}{
		{"negative number", -5, "negative"},
		{"zero value", 0, "zero"},
		{"even number", 4, "even"},
		{"odd number", 7, "odd"},
	}

	passed := 0
	for _, tc := range cases {
		got := classify(tc.input)
		status := "PASS"
		if got != tc.want {
			status = "FAIL"
		} else {
			passed++
		}
		fmt.Printf("[%s] %s: classify(%d) = %s (want %s)\n", status, tc.name, tc.input, got, tc.want)
	}
	fmt.Printf("%d/%d cases passed\n", passed, len(cases))
}
