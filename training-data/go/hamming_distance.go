package main

import (
	"errors"
	"fmt"
	"math/bits"
)

var errLength = errors.New("strings must have equal length")

func hammingString(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errLength
	}
	d := 0
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			d++
		}
	}
	return d, nil
}

func hammingUint(x, y uint64) int { return bits.OnesCount64(x ^ y) }

func main() {
	d, _ := hammingString("karolin", "kathrin")
	fmt.Println(d, hammingUint(1, 4), hammingUint(^uint64(0), 0))
	if _, err := hammingString("abc", "ab"); errors.Is(err, errLength) {
		fmt.Println("error:", err)
	}
}
