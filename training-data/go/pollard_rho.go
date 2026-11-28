package main

import "fmt"

func gcd(a, b uint64) uint64 {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func rho(n uint64) uint64 {
	if n%2 == 0 {
		return 2
	}
	f := func(v uint64) uint64 { return (v*v + 1) % n }
	x, y, d := uint64(2), uint64(2), uint64(1)
	for d == 1 {
		x, y = f(x), f(f(y))
		if x > y {
			d = gcd(x-y, n)
		} else {
			d = gcd(y-x, n)
		}
	}
	return d
}

func main() {
	n := uint64(8051)
	p := rho(n)
	fmt.Printf("%d = %d * %d\n", n, p, n/p)
}
