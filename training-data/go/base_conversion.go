package main

import (
	"fmt"
	"strconv"
)

const digits = "0123456789abcdefghijklmnopqrstuvwxyz"

func toBase(n int64, base int) string {
	if n == 0 {
		return "0"
	}
	neg := n < 0
	u := uint64(n)
	if neg {
		u = uint64(-n)
	}
	var buf []byte
	for ; u > 0; u /= uint64(base) {
		buf = append([]byte{digits[u%uint64(base)]}, buf...)
	}
	if neg {
		buf = append([]byte{'-'}, buf...)
	}
	return string(buf)
}

func main() {
	cases := []struct {
		n    int64
		base int
	}{{255, 2}, {255, 16}, {-1295, 36}, {0, 7}, {9223372036854775807, 36}}
	for _, c := range cases {
		s := toBase(c.n, c.base)
		back, err := strconv.ParseInt(s, c.base, 64)
		fmt.Printf("%d base %d = %s (stdlib %s, roundtrip ok=%v)\n", c.n, c.base, s, strconv.FormatInt(c.n, c.base), err == nil && back == c.n)
	}
}
