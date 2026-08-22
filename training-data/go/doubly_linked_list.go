package main

import "fmt"

type dNode struct {
	value      int
	prev, next *dNode
}

type doublyLinkedList struct {
	head, tail *dNode
}

func (dll *doublyLinkedList) append(value int) {
	node := &dNode{value: value}
	if dll.head == nil {
		dll.head = node
		dll.tail = node
		return
	}
	node.prev = dll.tail
	dll.tail.next = node
	dll.tail = node
}

func (dll *doublyLinkedList) remove(value int) bool {
	node := dll.head
	for node != nil {
		if node.value == value {
			if node.prev != nil {
				node.prev.next = node.next
			} else {
				dll.head = node.next
			}
			if node.next != nil {
				node.next.prev = node.prev
			} else {
				dll.tail = node.prev
			}
			return true
		}
		node = node.next
	}
	return false
}

func (dll *doublyLinkedList) toSlice() []int {
	var result []int
	node := dll.head
	for node != nil {
		result = append(result, node.value)
		node = node.next
	}
	return result
}

func main() {
	dll := &doublyLinkedList{}
	for _, v := range []int{1, 2, 3, 4} {
		dll.append(v)
	}
	dll.remove(3)
	fmt.Println(dll.toSlice())
}
