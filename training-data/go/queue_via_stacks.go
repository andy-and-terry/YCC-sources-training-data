package main

import "fmt"

type queueViaStacks struct {
	in, out []int
}

func (q *queueViaStacks) enqueue(item int) {
	q.in = append(q.in, item)
}

func (q *queueViaStacks) dequeue() (int, bool) {
	if len(q.out) == 0 {
		for len(q.in) > 0 {
			n := len(q.in) - 1
			q.out = append(q.out, q.in[n])
			q.in = q.in[:n]
		}
	}
	if len(q.out) == 0 {
		return 0, false
	}
	n := len(q.out) - 1
	item := q.out[n]
	q.out = q.out[:n]
	return item, true
}

func main() {
	q := &queueViaStacks{}
	q.enqueue(1)
	q.enqueue(2)
	q.enqueue(3)
	a, _ := q.dequeue()
	b, _ := q.dequeue()
	fmt.Println(a, b)
}
