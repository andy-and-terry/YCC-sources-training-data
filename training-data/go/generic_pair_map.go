package main

import "fmt"

type Pair[K comparable, V any] struct {
	Key K
	Val V
}

func (p Pair[K, V]) String() string { return fmt.Sprintf("(%v => %v)", p.Key, p.Val) }

func Zip[K comparable, V any](keys []K, vals []V) []Pair[K, V] {
	n := min(len(keys), len(vals))
	out := make([]Pair[K, V], 0, n)
	for i := 0; i < n; i++ {
		out = append(out, Pair[K, V]{keys[i], vals[i]})
	}
	return out
}

func ToMap[K comparable, V any](ps []Pair[K, V]) map[K]V {
	m := make(map[K]V, len(ps))
	for _, p := range ps {
		m[p.Key] = p.Val
	}
	return m
}

func main() {
	ps := Zip([]string{"a", "b", "c"}, []int{1, 2})
	fmt.Println(ps)
	fmt.Println(ToMap(ps))
}
