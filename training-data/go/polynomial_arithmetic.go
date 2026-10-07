package main

import (
	"fmt"
	"strings"
)

type Poly []int // Poly[i] is the coefficient of x^i

func (p Poly) trim() Poly {
	for len(p) > 1 && p[len(p)-1] == 0 {
		p = p[:len(p)-1]
	}
	return p
}

func (p Poly) Add(q Poly) Poly {
	out := make(Poly, max(len(p), len(q)))
	for i := range out {
		if i < len(p) {
			out[i] += p[i]
		}
		if i < len(q) {
			out[i] += q[i]
		}
	}
	return out.trim()
}

func (p Poly) Mul(q Poly) Poly {
	out := make(Poly, len(p)+len(q)-1)
	for i, a := range p {
		for j, b := range q {
			out[i+j] += a * b
		}
	}
	return out.trim()
}

func (p Poly) Eval(x int) int {
	acc := 0
	for i := len(p) - 1; i >= 0; i-- {
		acc = acc*x + p[i]
	}
	return acc
}

func (p Poly) Derivative() Poly {
	if len(p) <= 1 {
		return Poly{0}
	}
	out := make(Poly, len(p)-1)
	for i := 1; i < len(p); i++ {
		out[i-1] = i * p[i]
	}
	return out
}

func (p Poly) String() string {
	var terms []string
	for i := len(p) - 1; i >= 0; i-- {
		c := p[i]
		if c == 0 && len(p) > 1 {
			continue
		}
		switch i {
		case 0:
			terms = append(terms, fmt.Sprint(c))
		case 1:
			terms = append(terms, fmt.Sprintf("%dx", c))
		default:
			terms = append(terms, fmt.Sprintf("%dx^%d", c, i))
		}
	}
	return strings.Join(terms, " + ")
}

func main() {
	p := Poly{1, 1}
	cube := p.Mul(p).Mul(p)
	fmt.Println(cube, "|", cube.Derivative(), "|", cube.Eval(2))
	fmt.Println(Poly{-1, 0, 1}.Add(Poly{1, 0, -1}))
}
