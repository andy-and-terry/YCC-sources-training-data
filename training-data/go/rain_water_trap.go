package main

import "fmt"

func trap(h []int) int {
	lo, hi := 0, len(h)-1
	leftMax, rightMax, water := 0, 0, 0
	for lo < hi {
		if h[lo] < h[hi] {
			leftMax = max(leftMax, h[lo])
			water += leftMax - h[lo]
			lo++
		} else {
			rightMax = max(rightMax, h[hi])
			water += rightMax - h[hi]
			hi--
		}
	}
	return water
}

// trap2D solves the 3D "trapping rain water II" variant with a priority-flood BFS.
func trap2D(g [][]int) int {
	rows, cols := len(g), len(g[0])
	seen := make([][]bool, rows)
	for i := range seen {
		seen[i] = make([]bool, cols)
	}
	type cell struct{ h, r, c int }
	var heap []cell
	push := func(x cell) {
		heap = append(heap, x)
		for i := len(heap) - 1; i > 0 && heap[(i-1)/2].h > heap[i].h; i = (i - 1) / 2 {
			heap[i], heap[(i-1)/2] = heap[(i-1)/2], heap[i]
		}
	}
	pop := func() cell {
		top := heap[0]
		heap[0] = heap[len(heap)-1]
		heap = heap[:len(heap)-1]
		for i := 0; ; {
			m, l, r := i, 2*i+1, 2*i+2
			if l < len(heap) && heap[l].h < heap[m].h {
				m = l
			}
			if r < len(heap) && heap[r].h < heap[m].h {
				m = r
			}
			if m == i {
				break
			}
			heap[i], heap[m] = heap[m], heap[i]
			i = m
		}
		return top
	}
	for r := 0; r < rows; r++ {
		for c := 0; c < cols; c++ {
			if r == 0 || c == 0 || r == rows-1 || c == cols-1 {
				seen[r][c] = true
				push(cell{g[r][c], r, c})
			}
		}
	}
	water := 0
	for len(heap) > 0 {
		cur := pop()
		for _, d := range [4][2]int{{1, 0}, {-1, 0}, {0, 1}, {0, -1}} {
			nr, nc := cur.r+d[0], cur.c+d[1]
			if nr < 0 || nc < 0 || nr >= rows || nc >= cols || seen[nr][nc] {
				continue
			}
			seen[nr][nc] = true
			water += max(0, cur.h-g[nr][nc])
			push(cell{max(cur.h, g[nr][nc]), nr, nc})
		}
	}
	return water
}

func main() {
	fmt.Println(trap([]int{0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1}), trap([]int{4, 2, 0, 3, 2, 5}))
	fmt.Println(trap2D([][]int{{1, 4, 3, 1, 3, 2}, {3, 2, 1, 3, 2, 4}, {2, 3, 3, 2, 3, 1}}))
}
