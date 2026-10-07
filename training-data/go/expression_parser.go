package main

import (
	"fmt"
	"math"
	"strconv"
	"unicode"
)

type expr interface {
	eval(env map[string]float64) float64
}

type num float64
type variable string
type binary struct {
	op   byte
	l, r expr
}
type neg struct{ e expr }

func (n num) eval(map[string]float64) float64          { return float64(n) }
func (v variable) eval(env map[string]float64) float64 { return env[string(v)] }
func (n neg) eval(env map[string]float64) float64      { return -n.e.eval(env) }
func (b binary) eval(env map[string]float64) float64 {
	x, y := b.l.eval(env), b.r.eval(env)
	switch b.op {
	case '+':
		return x + y
	case '-':
		return x - y
	case '*':
		return x * y
	case '/':
		return x / y
	}
	return math.Pow(x, y)
}

type parser struct {
	s   string
	pos int
}

func (p *parser) peek() byte {
	for p.pos < len(p.s) && p.s[p.pos] == ' ' {
		p.pos++
	}
	if p.pos < len(p.s) {
		return p.s[p.pos]
	}
	return 0
}

func (p *parser) expr() expr {
	e := p.term()
	for c := p.peek(); c == '+' || c == '-'; c = p.peek() {
		p.pos++
		e = binary{c, e, p.term()}
	}
	return e
}

func (p *parser) term() expr {
	e := p.power()
	for c := p.peek(); c == '*' || c == '/'; c = p.peek() {
		p.pos++
		e = binary{c, e, p.power()}
	}
	return e
}

func (p *parser) power() expr {
	base := p.unary()
	if p.peek() == '^' {
		p.pos++
		return binary{'^', base, p.power()}
	}
	return base
}

func (p *parser) unary() expr {
	if p.peek() == '-' {
		p.pos++
		return neg{p.unary()}
	}
	return p.primary()
}

func (p *parser) primary() expr {
	c := p.peek()
	if c == '(' {
		p.pos++
		e := p.expr()
		if p.peek() != ')' {
			panic(fmt.Sprintf("expected ) at %d", p.pos))
		}
		p.pos++
		return e
	}
	start := p.pos
	if unicode.IsLetter(rune(c)) {
		for p.pos < len(p.s) && unicode.IsLetter(rune(p.s[p.pos])) {
			p.pos++
		}
		return variable(p.s[start:p.pos])
	}
	for p.pos < len(p.s) && (unicode.IsDigit(rune(p.s[p.pos])) || p.s[p.pos] == '.') {
		p.pos++
	}
	v, err := strconv.ParseFloat(p.s[start:p.pos], 64)
	if err != nil {
		panic(fmt.Sprintf("bad number at %d", start))
	}
	return num(v)
}

func parse(s string) (e expr, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("%v", r)
		}
	}()
	p := &parser{s: s}
	e = p.expr()
	if p.peek() != 0 {
		return nil, fmt.Errorf("trailing input at %d", p.pos)
	}
	return e, nil
}

func main() {
	env := map[string]float64{"x": 2, "y": 4}
	for _, s := range []string{"1 + 2 * 3", "2 ^ 3 ^ 2", "-(x + 3) * y", "(1 + 2", "x / 0.5"} {
		e, err := parse(s)
		if err != nil {
			fmt.Printf("%-14s error: %v\n", s, err)
			continue
		}
		fmt.Printf("%-14s = %g\n", s, e.eval(env))
	}
}
