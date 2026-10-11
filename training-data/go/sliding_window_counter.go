package main

import (
	"fmt"
	"time"
)

type SlidingWindow struct {
	limit  int
	window time.Duration
	events []time.Time
}

func (s *SlidingWindow) Allow(now time.Time) bool {
	cutoff := now.Add(-s.window)
	i := 0
	for i < len(s.events) && !s.events[i].After(cutoff) {
		i++
	}
	s.events = s.events[i:]
	if len(s.events) >= s.limit {
		return false
	}
	s.events = append(s.events, now)
	return true
}

func main() {
	sw := &SlidingWindow{limit: 3, window: time.Second}
	t0 := time.Date(2024, 1, 1, 0, 0, 0, 0, time.UTC)
	offsets := []int{0, 100, 200, 300, 900, 1000, 1150, 1250}
	for _, ms := range offsets {
		t := t0.Add(time.Duration(ms) * time.Millisecond)
		fmt.Printf("t=%4dms allowed=%v\n", ms, sw.Allow(t))
	}
}
