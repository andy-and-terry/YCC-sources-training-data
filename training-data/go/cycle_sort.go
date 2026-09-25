package main

import "fmt"

// cycleSort sorts in place with the minimum number of writes and returns that count.
func cycleSort(a []int) int {
	writes := 0
	position := func(item, start int) int {
		pos := start
		for _, v := range a[start+1:] {
			if v < item {
				pos++
			}
		}
		return pos
	}
	for start := 0; start < len(a)-1; start++ {
		item := a[start]
		pos := position(item, start)
		if pos == start {
			continue
		}
		for item == a[pos] {
			pos++
		}
		a[pos], item = item, a[pos]
		writes++
		for pos != start {
			pos = position(item, start)
			for item == a[pos] {
				pos++
			}
			a[pos], item = item, a[pos]
			writes++
		}
	}
	return writes
}

func main() {
	a := []int{1, 8, 3, 9, 10, 10, 2, 4}
	w := cycleSort(a)
	fmt.Println(a, "writes:", w)
}
