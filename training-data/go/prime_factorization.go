package main

import (
	"fmt"
	"sort"
	"strings"
)

type factor struct {
	prime uint64
	exp   int
}

func factorize(n uint64) []factor {
	var fs []factor
	for d := uint64(2); d*d <= n; d++ {
		if n%d != 0 {
			continue
		}
		f := factor{d, 0}
		for n%d == 0 {
			n /= d
			f.exp++
		}
		fs = append(fs, f)
	}
	if n > 1 {
		fs = append(fs, factor{n, 1})
	}
	return fs
}

func divisors(fs []factor) []uint64 {
	divs := []uint64{1}
	for _, f := range fs {
		cur := len(divs)
		p := uint64(1)
		for e := 1; e <= f.exp; e++ {
			p *= f.prime
			for i := 0; i < cur; i++ {
				divs = append(divs, divs[i]*p)
			}
		}
	}
	sort.Slice(divs, func(i, j int) bool { return divs[i] < divs[j] })
	return divs
}

func main() {
	for _, n := range []uint64{360, 97, 1001, 600851475143} {
		fs := factorize(n)
		parts := make([]string, len(fs))
		for i, f := range fs {
			if f.exp > 1 {
				parts[i] = fmt.Sprintf("%d^%d", f.prime, f.exp)
			} else {
				parts[i] = fmt.Sprint(f.prime)
			}
		}
		fmt.Printf("%d = %s (%d divisors)\n", n, strings.Join(parts, " * "), len(divisors(fs)))
	}
	fmt.Println("divisors of 360:", divisors(factorize(360)))
}
