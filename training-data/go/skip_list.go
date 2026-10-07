package main

import (
	"fmt"
	"math/rand"
)

const maxLevel = 4

type skipNode struct {
	value   int
	forward []*skipNode
}

type SkipList struct {
	head  *skipNode
	level int
	rng   *rand.Rand
}

func NewSkipList() *SkipList {
	return &SkipList{
		head:  &skipNode{forward: make([]*skipNode, maxLevel)},
		level: 1,
		rng:   rand.New(rand.NewSource(1)),
	}
}

func (s *SkipList) randomLevel() int {
	level := 1
	for level < maxLevel && s.rng.Intn(2) == 0 {
		level++
	}
	return level
}

func (s *SkipList) Insert(value int) {
	update := make([]*skipNode, maxLevel)
	current := s.head
	for i := s.level - 1; i >= 0; i-- {
		for current.forward[i] != nil && current.forward[i].value < value {
			current = current.forward[i]
		}
		update[i] = current
	}

	level := s.randomLevel()
	if level > s.level {
		for i := s.level; i < level; i++ {
			update[i] = s.head
		}
		s.level = level
	}

	node := &skipNode{value: value, forward: make([]*skipNode, level)}
	for i := 0; i < level; i++ {
		node.forward[i] = update[i].forward[i]
		update[i].forward[i] = node
	}
}

func (s *SkipList) Contains(value int) bool {
	current := s.head
	for i := s.level - 1; i >= 0; i-- {
		for current.forward[i] != nil && current.forward[i].value < value {
			current = current.forward[i]
		}
	}
	current = current.forward[0]
	return current != nil && current.value == value
}

func (s *SkipList) ToSlice() []int {
	var result []int
	for node := s.head.forward[0]; node != nil; node = node.forward[0] {
		result = append(result, node.value)
	}
	return result
}

func main() {
	list := NewSkipList()
	for _, v := range []int{3, 6, 7, 9, 12, 19, 17} {
		list.Insert(v)
	}

	fmt.Println(list.ToSlice())
	fmt.Println(list.Contains(9), list.Contains(100))
}
