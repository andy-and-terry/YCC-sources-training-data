package main

import (
	"fmt"
	"strconv"
)

type Option[T any] struct {
	val   T
	valid bool
}

func Some[T any](v T) Option[T] { return Option[T]{v, true} }
func None[T any]() Option[T]    { return Option[T]{} }

func (o Option[T]) OrElse(d T) T {
	if o.valid {
		return o.val
	}
	return d
}

func Map[T, U any](o Option[T], f func(T) U) Option[U] {
	if !o.valid {
		return None[U]()
	}
	return Some(f(o.val))
}

func parse(s string) Option[int] {
	n, err := strconv.Atoi(s)
	if err != nil {
		return None[int]()
	}
	return Some(n)
}

func main() {
	for _, s := range []string{"21", "abc"} {
		doubled := Map(parse(s), func(n int) int { return n * 2 })
		fmt.Println(s, "->", doubled.OrElse(-1))
	}
}
