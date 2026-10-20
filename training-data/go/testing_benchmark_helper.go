package main

import (
	"fmt"
	"strings"
	"testing"
)

func concatPlus(n int) string {
	s := ""
	for i := 0; i < n; i++ {
		s += "x"
	}
	return s
}

func concatBuilder(n int) string {
	var b strings.Builder
	for i := 0; i < n; i++ {
		b.WriteByte('x')
	}
	return b.String()
}

func main() {
	// testing.Benchmark lets us run a benchmark outside `go test`.
	plus := testing.Benchmark(func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			concatPlus(200)
		}
	})
	builder := testing.Benchmark(func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			concatBuilder(200)
		}
	})
	fmt.Println(plus.N > 0, builder.N > 0)
	fmt.Println(testing.AllocsPerRun(10, func() { concatBuilder(200) }) < 5)
}
