package main

import "fmt"

type renderer interface {
	renderCircle(radius float64)
	renderSquare(side float64)
}

type vectorRenderer struct{}

func (vectorRenderer) renderCircle(radius float64) {
	fmt.Printf("drawing circle of radius %.1f as vectors\n", radius)
}

func (vectorRenderer) renderSquare(side float64) {
	fmt.Printf("drawing square of side %.1f as vectors\n", side)
}

type rasterRenderer struct{}

func (rasterRenderer) renderCircle(radius float64) {
	fmt.Printf("drawing circle of radius %.1f as pixels\n", radius)
}

func (rasterRenderer) renderSquare(side float64) {
	fmt.Printf("drawing square of side %.1f as pixels\n", side)
}

type shape interface {
	draw()
}

type circle struct {
	renderer renderer
	radius   float64
}

func (c circle) draw() {
	c.renderer.renderCircle(c.radius)
}

type square struct {
	renderer renderer
	side     float64
}

func (s square) draw() {
	s.renderer.renderSquare(s.side)
}

func main() {
	shapes := []shape{
		circle{renderer: vectorRenderer{}, radius: 2},
		circle{renderer: rasterRenderer{}, radius: 3},
		square{renderer: vectorRenderer{}, side: 4},
	}
	for _, s := range shapes {
		s.draw()
	}
}
