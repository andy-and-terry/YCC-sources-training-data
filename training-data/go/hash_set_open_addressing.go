package main

import (
	"fmt"
	"hash/maphash"
	"strings"
)

type slotState uint8

const (
	empty slotState = iota
	full
	deleted
)

type slot struct {
	state slotState
	key   string
}

type StringSet struct {
	seed  maphash.Seed
	slots []slot
	size  int
	used  int
}

func NewStringSet() *StringSet { return &StringSet{seed: maphash.MakeSeed(), slots: make([]slot, 8)} }

func (s *StringSet) index(k string) int { return int(maphash.String(s.seed, k) % uint64(len(s.slots))) }

func (s *StringSet) find(k string) int {
	for i, n := s.index(k), 0; n < len(s.slots); i, n = (i+1)%len(s.slots), n+1 {
		switch sl := s.slots[i]; {
		case sl.state == empty:
			return -1
		case sl.state == full && sl.key == k:
			return i
		}
	}
	return -1
}

func (s *StringSet) Add(k string) {
	if s.find(k) >= 0 {
		return
	}
	if (s.used+1)*2 > len(s.slots) {
		old := s.slots
		s.slots, s.size, s.used = make([]slot, 2*len(old)), 0, 0
		for _, sl := range old {
			if sl.state == full {
				s.Add(sl.key)
			}
		}
	}
	i := s.index(k)
	for s.slots[i].state == full {
		i = (i + 1) % len(s.slots)
	}
	if s.slots[i].state == empty {
		s.used++
	}
	s.slots[i] = slot{full, k}
	s.size++
}

func (s *StringSet) Remove(k string) bool {
	i := s.find(k)
	if i < 0 {
		return false
	}
	s.slots[i] = slot{state: deleted}
	s.size--
	return true
}

func (s *StringSet) Contains(k string) bool { return s.find(k) >= 0 }

func main() {
	set := NewStringSet()
	for _, w := range strings.Fields("the quick brown fox jumps over the lazy dog") {
		set.Add(w)
	}
	set.Remove("fox")
	fmt.Println(set.size, set.Contains("fox"), set.Contains("dog"))
}
