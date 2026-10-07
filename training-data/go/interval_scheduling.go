package main

import (
	"fmt"
	"sort"
)

type interval struct{ start, end int }

func maxNonOverlapping(iv []interval) []interval {
	s := append([]interval(nil), iv...)
	sort.Slice(s, func(i, j int) bool { return s[i].end < s[j].end })
	var chosen []interval
	end := -1 << 31
	for _, x := range s {
		if x.start >= end {
			chosen = append(chosen, x)
			end = x.end
		}
	}
	return chosen
}

func minRooms(iv []interval) int {
	starts, ends := make([]int, len(iv)), make([]int, len(iv))
	for i, x := range iv {
		starts[i], ends[i] = x.start, x.end
	}
	sort.Ints(starts)
	sort.Ints(ends)
	rooms, best, j := 0, 0, 0
	for _, s := range starts {
		for ends[j] <= s {
			j++
			rooms--
		}
		rooms++
		best = max(best, rooms)
	}
	return best
}

func main() {
	m := []interval{{1, 4}, {3, 5}, {0, 6}, {5, 7}, {3, 9}, {5, 9}, {6, 10}, {8, 11}, {8, 12}, {2, 14}, {12, 16}}
	fmt.Println(maxNonOverlapping(m), "rooms:", minRooms(m))
}
