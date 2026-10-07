package main

import (
	"fmt"
	"sync"
)

type readyQueue struct {
	mu    sync.Mutex
	cond  *sync.Cond
	items []int
	done  bool
}

func newReadyQueue() *readyQueue {
	q := &readyQueue{}
	q.cond = sync.NewCond(&q.mu)
	return q
}

func (q *readyQueue) push(v int) {
	q.mu.Lock()
	q.items = append(q.items, v)
	q.mu.Unlock()
	q.cond.Signal()
}

func (q *readyQueue) close() {
	q.mu.Lock()
	q.done = true
	q.mu.Unlock()
	q.cond.Broadcast()
}

func (q *readyQueue) consume(fn func(int)) {
	q.mu.Lock()
	defer q.mu.Unlock()
	for {
		for len(q.items) == 0 && !q.done {
			q.cond.Wait()
		}
		if len(q.items) == 0 && q.done {
			return
		}
		v := q.items[0]
		q.items = q.items[1:]
		q.mu.Unlock()
		fn(v)
		q.mu.Lock()
	}
}

func main() {
	q := newReadyQueue()
	var wg sync.WaitGroup
	var results []int
	var resultsMu sync.Mutex

	wg.Add(1)
	go func() {
		defer wg.Done()
		q.consume(func(v int) {
			resultsMu.Lock()
			results = append(results, v*v)
			resultsMu.Unlock()
		})
	}()

	for i := 1; i <= 5; i++ {
		q.push(i)
	}
	q.close()
	wg.Wait()

	fmt.Println(results)
}
