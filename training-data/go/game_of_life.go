package main

import (
	"fmt"
	"strings"
)

type grid struct {
	w, h  int
	cells []bool
}

func newGrid(w, h int) *grid { return &grid{w, h, make([]bool, w*h)} }

func (g *grid) alive(x, y int) bool {
	x, y = (x+g.w)%g.w, (y+g.h)%g.h
	return g.cells[y*g.w+x]
}

func (g *grid) set(x, y int, v bool) { g.cells[y*g.w+x] = v }

func (g *grid) step() *grid {
	next := newGrid(g.w, g.h)
	for y := 0; y < g.h; y++ {
		for x := 0; x < g.w; x++ {
			n := 0
			for dy := -1; dy <= 1; dy++ {
				for dx := -1; dx <= 1; dx++ {
					if (dx != 0 || dy != 0) && g.alive(x+dx, y+dy) {
						n++
					}
				}
			}
			next.set(x, y, n == 3 || (n == 2 && g.alive(x, y)))
		}
	}
	return next
}

func (g *grid) String() string {
	var b strings.Builder
	for y := 0; y < g.h; y++ {
		for x := 0; x < g.w; x++ {
			if g.alive(x, y) {
				b.WriteByte('#')
			} else {
				b.WriteByte('.')
			}
		}
		b.WriteByte('\n')
	}
	return b.String()
}

func main() {
	g := newGrid(8, 6)
	for _, p := range [][2]int{{1, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}} {
		g.set(p[0], p[1], true)
	}
	for gen := 0; gen < 3; gen++ {
		fmt.Printf("gen %d\n%s\n", gen, g)
		g = g.step()
	}
}
