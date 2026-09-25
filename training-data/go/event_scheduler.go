package main

import (
	"container/heap"
	"fmt"
)

type event struct {
	at     float64
	seq    int
	name   string
	action func()
}

type queue []*event

func (q queue) Len() int { return len(q) }
func (q queue) Less(i, j int) bool {
	if q[i].at != q[j].at {
		return q[i].at < q[j].at
	}
	return q[i].seq < q[j].seq
}
func (q queue) Swap(i, j int) { q[i], q[j] = q[j], q[i] }
func (q *queue) Push(x any)   { *q = append(*q, x.(*event)) }
func (q *queue) Pop() any {
	old := *q
	e := old[len(old)-1]
	*q = old[:len(old)-1]
	return e
}

type Sim struct {
	now float64
	seq int
	q   queue
}

func (s *Sim) After(d float64, name string, fn func()) {
	s.seq++
	heap.Push(&s.q, &event{s.now + d, s.seq, name, fn})
}

func (s *Sim) Run() {
	for s.q.Len() > 0 {
		e := heap.Pop(&s.q).(*event)
		s.now = e.at
		fmt.Printf("t=%4.1f %s\n", s.now, e.name)
		e.action()
	}
}

func main() {
	sim := &Sim{}
	serverFree := 0.0
	customers := []struct{ arrive, service float64 }{{0, 3}, {1, 2}, {1.5, 4}, {6, 1}}
	for i, c := range customers {
		i, c := i, c
		sim.After(c.arrive, fmt.Sprintf("c%d arrives", i), func() {
			start := max(sim.now, serverFree)
			serverFree = start + c.service
			sim.After(serverFree-sim.now, fmt.Sprintf("c%d leaves (waited %.1f)", i, start-c.arrive), func() {})
		})
	}
	sim.Run()
}
