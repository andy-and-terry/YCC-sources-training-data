package main

import "fmt"

type fenwickTree struct {
	tree []int
	size int
}

func newFenwickTree(size int) *fenwickTree {
	return &fenwickTree{tree: make([]int, size+1), size: size}
}

func (ft *fenwickTree) add(index, delta int) {
	index++
	for index <= ft.size {
		ft.tree[index] += delta
		index += index & (-index)
	}
}

func (ft *fenwickTree) prefixSum(index int) int {
	index++
	total := 0
	for index > 0 {
		total += ft.tree[index]
		index -= index & (-index)
	}
	return total
}

func (ft *fenwickTree) rangeSum(left, right int) int {
	if left > 0 {
		return ft.prefixSum(right) - ft.prefixSum(left-1)
	}
	return ft.prefixSum(right)
}

func main() {
	ft := newFenwickTree(6)
	for i, v := range []int{1, 3, 5, 7, 9, 11} {
		ft.add(i, v)
	}
	fmt.Println(ft.rangeSum(1, 3))
}
