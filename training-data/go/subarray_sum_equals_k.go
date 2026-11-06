// Count contiguous subarrays whose sum equals k (prefix sums + map).
package main

import "fmt"

func countSubarrays(nums []int, k int) int {
	seen := map[int]int{0: 1}
	total, count := 0, 0
	for _, x := range nums {
		total += x
		count += seen[total-k]
		seen[total]++
	}
	return count
}

func main() {
	fmt.Println(countSubarrays([]int{1, 1, 1}, 2))
}
