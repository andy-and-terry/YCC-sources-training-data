package main

import "fmt"

// nextGreater returns, for each element, the next strictly larger value or -1.
func nextGreater(a []int) []int {
	res := make([]int, len(a))
	var stack []int // indices with decreasing values
	for i := range res {
		res[i] = -1
	}
	for i, v := range a {
		for len(stack) > 0 && a[stack[len(stack)-1]] < v {
			top := stack[len(stack)-1]
			stack = stack[:len(stack)-1]
			res[top] = v
		}
		stack = append(stack, i)
	}
	return res
}

func main() {
	fmt.Println(nextGreater([]int{4, 5, 2, 25, 7, 8}))
	fmt.Println(nextGreater([]int{3, 2, 1}))
}
