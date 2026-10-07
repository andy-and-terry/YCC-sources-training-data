package main

import "fmt"

func interpolationSearch(a []int, target int) int {
	lo, hi := 0, len(a)-1
	for lo <= hi && target >= a[lo] && target <= a[hi] {
		if a[hi] == a[lo] {
			if a[lo] == target {
				return lo
			}
			return -1
		}
		pos := lo + (target-a[lo])*(hi-lo)/(a[hi]-a[lo])
		switch {
		case a[pos] == target:
			return pos
		case a[pos] < target:
			lo = pos + 1
		default:
			hi = pos - 1
		}
	}
	return -1
}

func main() {
	a := []int{10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47}
	fmt.Println(interpolationSearch(a, 18), interpolationSearch(a, 25))
}
