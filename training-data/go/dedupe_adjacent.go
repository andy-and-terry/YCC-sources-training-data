package main

import "fmt"

// Generic adjacent de-duplication (Go 1.18+).
func dedupe[T comparable](xs []T) []T {
	var out []T
	for i, x := range xs {
		if i == 0 || x != xs[i-1] {
			out = append(out, x)
		}
	}
	return out
}

func main() { fmt.Println(string(dedupe([]rune("aabbbcdd")))) }
