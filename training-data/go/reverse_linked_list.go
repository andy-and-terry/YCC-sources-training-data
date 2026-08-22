package main

import "fmt"

type node struct {
	value int
	next  *node
}

func reverse(head *node) *node {
	var prev *node
	current := head
	for current != nil {
		next := current.next
		current.next = prev
		prev = current
		current = next
	}
	return prev
}

func toSlice(head *node) []int {
	var result []int
	for head != nil {
		result = append(result, head.value)
		head = head.next
	}
	return result
}

func main() {
	head := &node{1, &node{2, &node{3, &node{4, nil}}}}
	fmt.Println(toSlice(reverse(head)))
}
