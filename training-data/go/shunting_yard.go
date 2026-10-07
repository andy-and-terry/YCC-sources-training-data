package main

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

var prec = map[string]int{"+": 1, "-": 1, "*": 2, "/": 2, "^": 3}

func toRPN(tokens []string) []string {
	var out, ops []string
	for _, t := range tokens {
		switch {
		case prec[t] > 0:
			for len(ops) > 0 {
				top := ops[len(ops)-1]
				if prec[top] > prec[t] || (prec[top] == prec[t] && t != "^") {
					out = append(out, top)
					ops = ops[:len(ops)-1]
				} else {
					break
				}
			}
			ops = append(ops, t)
		case t == "(":
			ops = append(ops, t)
		case t == ")":
			for ops[len(ops)-1] != "(" {
				out = append(out, ops[len(ops)-1])
				ops = ops[:len(ops)-1]
			}
			ops = ops[:len(ops)-1]
		default:
			out = append(out, t)
		}
	}
	for i := len(ops) - 1; i >= 0; i-- {
		out = append(out, ops[i])
	}
	return out
}

func evalRPN(rpn []string) float64 {
	var st []float64
	for _, t := range rpn {
		if prec[t] == 0 {
			v, _ := strconv.ParseFloat(t, 64)
			st = append(st, v)
			continue
		}
		a, b := st[len(st)-2], st[len(st)-1]
		st = st[:len(st)-2]
		var r float64
		switch t {
		case "+":
			r = a + b
		case "-":
			r = a - b
		case "*":
			r = a * b
		case "/":
			r = a / b
		case "^":
			r = math.Pow(a, b)
		}
		st = append(st, r)
	}
	return st[0]
}

func main() {
	rpn := toRPN(strings.Fields("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3"))
	fmt.Println(strings.Join(rpn, " "), "=", evalRPN(rpn))
}
