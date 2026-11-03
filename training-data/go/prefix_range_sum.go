package main

import "fmt"

type RangeSum struct{ prefix []int }

func NewRangeSum(values []int) *RangeSum {
	p := make([]int, len(values)+1)
	for i, v := range values {
		p[i+1] = p[i] + v
	}
	return &RangeSum{p}
}

func (r *RangeSum) Query(lo, hi int) int { return r.prefix[hi] - r.prefix[lo] }

func main() {
	rs := NewRangeSum([]int{3, 1, 4, 1, 5, 9, 2, 6})
	fmt.Println(rs.Query(2, 5))
}
