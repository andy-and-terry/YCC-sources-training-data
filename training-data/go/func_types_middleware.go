package main

import (
	"fmt"
	"strings"
)

type Handler func(string) string
type Middleware func(Handler) Handler

func Chain(h Handler, ms ...Middleware) Handler {
	for i := len(ms) - 1; i >= 0; i-- {
		h = ms[i](h)
	}
	return h
}

func Logging(next Handler) Handler {
	return func(s string) string {
		fmt.Println("-> input:", s)
		out := next(s)
		fmt.Println("<- output:", out)
		return out
	}
}

func Upper(next Handler) Handler {
	return func(s string) string { return next(strings.ToUpper(s)) }
}

func Exclaim(next Handler) Handler {
	return func(s string) string { return next(s) + "!" }
}

func main() {
	base := func(s string) string { return "hello " + s }
	h := Chain(base, Logging, Upper, Exclaim)
	h("gopher")
}
