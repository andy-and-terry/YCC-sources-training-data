package main

import "fmt"

type segmentTree struct {
	n    int
	tree []int
}

func newSegmentTree(data []int) *segmentTree {
	n := len(data)
	tree := make([]int, 2*n)
	copy(tree[n:], data)
	for i := n - 1; i > 0; i-- {
		tree[i] = tree[2*i] + tree[2*i+1]
	}
	return &segmentTree{n: n, tree: tree}
}

func (st *segmentTree) update(index, value int) {
	i := index + st.n
	st.tree[i] = value
	for i > 1 {
		i /= 2
		st.tree[i] = st.tree[2*i] + st.tree[2*i+1]
	}
}

func (st *segmentTree) query(left, right int) int {
	left += st.n
	right += st.n
	total := 0
	for left < right {
		if left%2 == 1 {
			total += st.tree[left]
			left++
		}
		if right%2 == 1 {
			right--
			total += st.tree[right]
		}
		left /= 2
		right /= 2
	}
	return total
}

func main() {
	tree := newSegmentTree([]int{1, 3, 5, 7, 9, 11})
	fmt.Println(tree.query(1, 4))
	tree.update(1, 10)
	fmt.Println(tree.query(1, 4))
}
