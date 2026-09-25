package main

import "fmt"

type node struct {
	val  int
	next *node
}

func findCycle(head *node) (*node, int) {
	slow, fast := head, head
	for fast != nil && fast.next != nil {
		slow, fast = slow.next, fast.next.next
		if slow == fast {
			length := 1
			for p := slow.next; p != slow; p = p.next {
				length++
			}
			for slow = head; slow != fast; slow, fast = slow.next, fast.next {
			}
			return slow, length
		}
	}
	return nil, 0
}

func build(n, loopTo int) *node {
	nodes := make([]*node, n)
	for i := range nodes {
		nodes[i] = &node{val: i * 10}
	}
	for i := 0; i+1 < n; i++ {
		nodes[i].next = nodes[i+1]
	}
	if loopTo >= 0 {
		nodes[n-1].next = nodes[loopTo]
	}
	return nodes[0]
}

func main() {
	if s, l := findCycle(build(8, 3)); s != nil {
		fmt.Println("cycle starts at", s.val, "length", l)
	}
	s, _ := findCycle(build(5, -1))
	fmt.Println("no-loop result:", s)
}
