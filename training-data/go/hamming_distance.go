package main

import (
	"errors"
	"fmt"
)

func hamming(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("strands must be of equal length")
	}
	d := 0
	for i := range a {
		if a[i] != b[i] {
			d++
		}
	}
	return d, nil
}

func main() {
	fmt.Println(hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
	fmt.Println(hamming("AB", "A"))
}
