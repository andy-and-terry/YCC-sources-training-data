package main

import "fmt"

type dataProcessor interface {
	load() []int
	process(data []int) []int
	save(data []int)
}

func runPipeline(p dataProcessor) {
	data := p.load()
	data = p.process(data)
	p.save(data)
}

type doublingProcessor struct {
	source []int
}

func (d doublingProcessor) load() []int {
	return d.source
}

func (doublingProcessor) process(data []int) []int {
	out := make([]int, len(data))
	for i, v := range data {
		out[i] = v * 2
	}
	return out
}

func (doublingProcessor) save(data []int) {
	fmt.Println("doubled:", data)
}

type squaringProcessor struct {
	source []int
}

func (s squaringProcessor) load() []int {
	return s.source
}

func (squaringProcessor) process(data []int) []int {
	out := make([]int, len(data))
	for i, v := range data {
		out[i] = v * v
	}
	return out
}

func (squaringProcessor) save(data []int) {
	fmt.Println("squared:", data)
}

func main() {
	runPipeline(doublingProcessor{source: []int{1, 2, 3, 4}})
	runPipeline(squaringProcessor{source: []int{1, 2, 3, 4}})
}
