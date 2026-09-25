package main

import "fmt"

type MovingAverage struct {
	buf        []float64
	idx, count int
	sum        float64
}

func NewMovingAverage(size int) *MovingAverage {
	return &MovingAverage{buf: make([]float64, size)}
}

func (m *MovingAverage) Next(v float64) float64 {
	m.sum += v - m.buf[m.idx]
	m.buf[m.idx] = v
	m.idx = (m.idx + 1) % len(m.buf)
	if m.count < len(m.buf) {
		m.count++
	}
	return m.sum / float64(m.count)
}

func main() {
	ma := NewMovingAverage(3)
	for _, v := range []float64{1, 10, 3, 5, 8, 2} {
		fmt.Printf("%.2f ", ma.Next(v))
	}
	fmt.Println()
}
