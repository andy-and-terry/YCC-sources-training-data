package main

import (
	"fmt"
	"math/big"
)

type frac struct{ n, d int64 }

func gcd(a, b int64) int64 {
	if a < 0 {
		a = -a
	}
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func newFrac(n, d int64) frac {
	if d == 0 {
		panic("zero denominator")
	}
	if d < 0 {
		n, d = -n, -d
	}
	if g := gcd(n, d); g > 1 {
		n, d = n/g, d/g
	}
	return frac{n, d}
}

func (a frac) Add(b frac) frac { return newFrac(a.n*b.d+b.n*a.d, a.d*b.d) }
func (a frac) Sub(b frac) frac { return newFrac(a.n*b.d-b.n*a.d, a.d*b.d) }
func (a frac) Mul(b frac) frac { return newFrac(a.n*b.n, a.d*b.d) }
func (a frac) Div(b frac) frac { return newFrac(a.n*b.d, a.d*b.n) }

func (a frac) String() string {
	if a.d == 1 {
		return fmt.Sprint(a.n)
	}
	return fmt.Sprintf("%d/%d", a.n, a.d)
}

func main() {
	a, b := newFrac(1, 3), newFrac(1, 6)
	fmt.Println(a.Add(b), a.Sub(b), a.Mul(b), a.Div(b))
	h := newFrac(0, 1)
	for k := int64(1); k <= 20; k++ {
		h = h.Add(newFrac(1, k))
	}
	fmt.Println("H(20) =", h)
	// the standard library's big.Rat gives the same result and never overflows
	r := new(big.Rat)
	for k := int64(1); k <= 50; k++ {
		r.Add(r, big.NewRat(1, k))
	}
	fmt.Println("H(50) =", r)
}
