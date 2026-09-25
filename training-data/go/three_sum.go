package main

import (
	"fmt"
	"slices"
)

func threeSum(nums []int, target int) [][3]int {
	a := slices.Clone(nums)
	slices.Sort(a)
	var res [][3]int
	for i := 0; i+2 < len(a); i++ {
		if i > 0 && a[i] == a[i-1] {
			continue
		}
		lo, hi := i+1, len(a)-1
		for lo < hi {
			switch s := a[i] + a[lo] + a[hi]; {
			case s < target:
				lo++
			case s > target:
				hi--
			default:
				res = append(res, [3]int{a[i], a[lo], a[hi]})
				for lo < hi && a[lo] == a[lo+1] {
					lo++
				}
				for lo < hi && a[hi] == a[hi-1] {
					hi--
				}
				lo, hi = lo+1, hi-1
			}
		}
	}
	return res
}

func main() {
	fmt.Println(threeSum([]int{-1, 0, 1, 2, -1, -4}, 0))
	fmt.Println(threeSum([]int{1, 2, 3, 4, 5, 6}, 10))
}
