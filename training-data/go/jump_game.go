package main

import "fmt"

func canJump(a []int) bool {
	reach := 0
	for i := 0; i < len(a) && i <= reach; i++ {
		reach = max(reach, i+a[i])
	}
	return reach >= len(a)-1
}

func minJumps(a []int) int {
	jumps, end, far := 0, 0, 0
	for i := 0; i < len(a)-1; i++ {
		far = max(far, i+a[i])
		if i == end {
			if far <= i {
				return -1
			}
			jumps++
			end = far
		}
	}
	return jumps
}

func main() {
	fmt.Println(canJump([]int{2, 3, 1, 1, 4}), canJump([]int{3, 2, 1, 0, 4}))
	fmt.Println(minJumps([]int{2, 3, 1, 1, 4}), minJumps([]int{3, 2, 1, 0, 4}))
}
