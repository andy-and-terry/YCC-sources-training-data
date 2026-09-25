package main

import "fmt"

type SMA struct {
	buf     []float64
	head, n int
	sum     float64
}

func NewSMA(size int) *SMA { return &SMA{buf: make([]float64, size)} }

func (s *SMA) Add(x float64) float64 {
	if s.n == len(s.buf) {
		s.sum -= s.buf[s.head]
	} else {
		s.n++
	}
	s.buf[s.head] = x
	s.head = (s.head + 1) % len(s.buf)
	s.sum += x
	return s.sum / float64(s.n)
}

type EMA struct {
	alpha, value float64
	started      bool
}

func (e *EMA) Add(x float64) float64 {
	if !e.started {
		e.value, e.started = x, true
	} else {
		e.value = e.alpha*x + (1-e.alpha)*e.value
	}
	return e.value
}

func main() {
	sma, ema := NewSMA(3), &EMA{alpha: 0.5}
	for _, p := range []float64{10, 11, 12, 13, 12, 11, 15, 18, 17, 16} {
		fmt.Printf("%5.1f  sma=%7.3f  ema=%7.3f\n", p, sma.Add(p), ema.Add(p))
	}
}
