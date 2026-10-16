package main

import (
	"fmt"
	"math/bits"
)

type BitSet []uint64

func (b *BitSet) Add(i int) {
	w := i / 64
	for len(*b) <= w {
		*b = append(*b, 0)
	}
	(*b)[w] |= 1 << (uint(i) % 64)
}

func (b BitSet) Has(i int) bool {
	w := i / 64
	return w < len(b) && b[w]&(1<<(uint(i)%64)) != 0
}

func (b BitSet) Count() (n int) {
	for _, w := range b {
		n += bits.OnesCount64(w)
	}
	return
}

func main() {
	var s BitSet
	for _, v := range []int{1, 5, 64, 130, 5} {
		s.Add(v)
	}
	fmt.Println(s.Has(5), s.Has(6), s.Has(130), s.Count(), len(s))
}
