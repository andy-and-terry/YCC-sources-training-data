package main

import (
	"fmt"
	"math/bits"
)

type BitSet []uint64

func NewBitSet(n int) BitSet { return make(BitSet, (n+63)/64) }

func (b BitSet) Set(i int)      { b[i/64] |= 1 << (i % 64) }
func (b BitSet) Clear(i int)    { b[i/64] &^= 1 << (i % 64) }
func (b BitSet) Has(i int) bool { return b[i/64]&(1<<(i%64)) != 0 }

func (b BitSet) Count() int {
	n := 0
	for _, w := range b {
		n += bits.OnesCount64(w)
	}
	return n
}

func main() {
	s := NewBitSet(200)
	for _, i := range []int{1, 63, 64, 130, 199} {
		s.Set(i)
	}
	s.Clear(63)
	fmt.Println(s.Has(1), s.Has(63), s.Has(64), s.Count())
}
