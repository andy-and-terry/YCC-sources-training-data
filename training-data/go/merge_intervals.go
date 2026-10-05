package main

import (
	"fmt"
	"sort"
)

type Interval struct {
	Start, End int
}

func mergeIntervals(in []Interval) []Interval {
	if len(in) == 0 {
		return nil
	}
	sorted := append([]Interval(nil), in...)
	sort.Slice(sorted, func(i, j int) bool { return sorted[i].Start < sorted[j].Start })
	out := []Interval{sorted[0]}
	for _, iv := range sorted[1:] {
		last := &out[len(out)-1]
		if iv.Start <= last.End {
			if iv.End > last.End {
				last.End = iv.End
			}
		} else {
			out = append(out, iv)
		}
	}
	return out
}

func main() {
	fmt.Println(mergeIntervals([]Interval{{1, 3}, {8, 10}, {2, 6}, {15, 18}, {17, 20}}))
}
