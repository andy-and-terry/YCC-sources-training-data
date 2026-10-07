package main

import (
	"fmt"
	"slices"
)

type set[T comparable] map[T]struct{}

func setOf[T comparable](xs ...T) set[T] {
	s := set[T]{}
	for _, x := range xs {
		s[x] = struct{}{}
	}
	return s
}

func (s set[T]) intersect(o set[T]) set[T] {
	out := set[T]{}
	for k := range s {
		if _, ok := o[k]; ok {
			out[k] = struct{}{}
		}
	}
	return out
}

func multisetIntersect(a, b []int) []int {
	counts := map[int]int{}
	for _, x := range a {
		counts[x]++
	}
	var out []int
	for _, x := range b {
		if counts[x] > 0 {
			out = append(out, x)
			counts[x]--
		}
	}
	return out
}

func main() {
	a, b := []int{4, 9, 5, 4, 4}, []int{9, 4, 9, 8, 4}
	var keys []int
	for k := range setOf(a...).intersect(setOf(b...)) {
		keys = append(keys, k)
	}
	slices.Sort(keys)
	fmt.Println(keys, multisetIntersect(a, b))
}
