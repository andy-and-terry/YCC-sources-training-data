package main

import "fmt"

type imageLoader interface {
	display() string
}

type realImage struct {
	filename string
}

func newRealImage(filename string) *realImage {
	fmt.Println("loading image from disk:", filename)
	return &realImage{filename: filename}
}

func (r *realImage) display() string {
	return "displaying " + r.filename
}

type proxyImage struct {
	filename string
	real     *realImage
}

func (p *proxyImage) display() string {
	if p.real == nil {
		p.real = newRealImage(p.filename)
	}
	return p.real.display()
}

func main() {
	var img imageLoader = &proxyImage{filename: "photo.png"}
	fmt.Println("proxy created, image not loaded yet")
	fmt.Println(img.display())
	fmt.Println(img.display())
}
