package main

import "fmt"

// maxSubarray returns the best sum and the inclusive bounds of that subarray.
func maxSubarray(a []int) (best, start, end int) {
	best, cur, s := a[0], a[0], 0
	for i := 1; i < len(a); i++ {
		if cur < 0 {
			cur, s = a[i], i
		} else {
			cur += a[i]
		}
		if cur > best {
			best, start, end = cur, s, i
		}
	}
	return
}

func main() {
	a := []int{-2, 1, -3, 4, -1, 2, 1, -5, 4}
	best, i, j := maxSubarray(a)
	fmt.Println(best, a[i:j+1])
	fmt.Println(maxSubarray([]int{-3, -1, -2}))
}
