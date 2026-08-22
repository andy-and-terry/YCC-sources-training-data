package main

import "fmt"

type minStack struct {
	items, mins []int
}

func (s *minStack) push(value int) {
	s.items = append(s.items, value)
	if len(s.mins) == 0 || value < s.mins[len(s.mins)-1] {
		s.mins = append(s.mins, value)
	} else {
		s.mins = append(s.mins, s.mins[len(s.mins)-1])
	}
}

func (s *minStack) pop() int {
	n := len(s.items) - 1
	item := s.items[n]
	s.items = s.items[:n]
	s.mins = s.mins[:n]
	return item
}

func (s *minStack) getMin() int {
	return s.mins[len(s.mins)-1]
}

func main() {
	s := &minStack{}
	s.push(3)
	s.push(1)
	s.push(2)
	fmt.Println(s.getMin())
	s.pop()
	fmt.Println(s.getMin())
}
