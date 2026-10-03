package main

import "fmt"

type renderer interface {
	renderShape(name string)
}

type vectorRenderer struct{}

func (vectorRenderer) renderShape(name string) {
	fmt.Printf("drawing %s as vector outline\n", name)
}

type rasterRenderer struct{}

func (rasterRenderer) renderShape(name string) {
	fmt.Printf("drawing %s as raster pixels\n", name)
}

type shape struct {
	renderer renderer
	name     string
}

func (s shape) draw() {
	s.renderer.renderShape(s.name)
}

func main() {
	circle := shape{renderer: vectorRenderer{}, name: "circle"}
	square := shape{renderer: rasterRenderer{}, name: "square"}
	circle.draw()
	square.draw()
}
