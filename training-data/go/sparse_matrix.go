package main

import (
	"fmt"
	"sort"
)

type coord struct{ r, c int }

type Sparse struct {
	rows, cols int
	data       map[coord]float64
}

func NewSparse(rows, cols int) *Sparse { return &Sparse{rows, cols, map[coord]float64{}} }

func (m *Sparse) Set(r, c int, v float64) {
	if v == 0 {
		delete(m.data, coord{r, c})
	} else {
		m.data[coord{r, c}] = v
	}
}

func (m *Sparse) Mul(o *Sparse) *Sparse {
	byRow := map[int][]coord{}
	for k := range o.data {
		byRow[k.r] = append(byRow[k.r], k)
	}
	out := NewSparse(m.rows, o.cols)
	for k, v := range m.data {
		for _, ok := range byRow[k.c] {
			key := coord{k.r, ok.c}
			out.Set(key.r, key.c, out.data[key]+v*o.data[ok])
		}
	}
	return out
}

func (m *Sparse) Entries() []string {
	keys := make([]coord, 0, len(m.data))
	for k := range m.data {
		keys = append(keys, k)
	}
	sort.Slice(keys, func(i, j int) bool {
		if keys[i].r != keys[j].r {
			return keys[i].r < keys[j].r
		}
		return keys[i].c < keys[j].c
	})
	out := make([]string, len(keys))
	for i, k := range keys {
		out[i] = fmt.Sprintf("(%d,%d)=%g", k.r, k.c, m.data[k])
	}
	return out
}

func main() {
	a, b := NewSparse(3, 3), NewSparse(3, 3)
	a.Set(0, 0, 1)
	a.Set(1, 2, 2)
	a.Set(2, 1, 3)
	b.Set(0, 1, 4)
	b.Set(1, 0, 5)
	b.Set(2, 2, 6)
	fmt.Println(a.Mul(b).Entries())
}
