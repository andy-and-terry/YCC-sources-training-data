package main

import "fmt"

func sum(nums ...int) int {
	total := 0
	for _, n := range nums {
		total += n
	}
	return total
}

func joinWith(sep string, parts ...string) string {
	out := ""
	for i, p := range parts {
		if i > 0 {
			out += sep
		}
		out += p
	}
	return out
}

func describe(label string, args ...interface{}) {
	fmt.Printf("%s: %d args %v\n", label, len(args), args)
}

func main() {
	fmt.Println(sum())
	fmt.Println(sum(1, 2, 3))

	values := []int{10, 20, 30, 40}
	fmt.Println(sum(values...))

	fmt.Println(joinWith(", ", "a", "b", "c"))

	describe("none")
	describe("mixed", 1, "two", 3.0, true)

	// A variadic parameter is just a slice; the callee shares the backing array.
	double := func(xs ...int) {
		for i := range xs {
			xs[i] *= 2
		}
	}
	double(values...)
	fmt.Println(values)
}
