package main

import "fmt"

type SqrtSum struct {
	a, blk []int
	bs     int
}

func NewSqrtSum(a []int, bs int) *SqrtSum {
	blk := make([]int, (len(a)+bs-1)/bs)
	for i, v := range a {
		blk[i/bs] += v
	}
	return &SqrtSum{a, blk, bs}
}

func (t *SqrtSum) Query(l, r int) int {
	s := 0
	for i := l; i <= r; {
		if i%t.bs == 0 && i+t.bs-1 <= r {
			s += t.blk[i/t.bs]
			i += t.bs
		} else {
			s += t.a[i]
			i++
		}
	}
	return s
}

func main() {
	t := NewSqrtSum([]int{5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5}, 4)
	fmt.Println(t.Query(2, 9))
}
