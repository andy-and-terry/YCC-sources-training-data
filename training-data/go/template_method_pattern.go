package main

import "fmt"

type dataProcessor interface {
	load(data []int) []int
	transform(data []int) []int
	output(data []int)
}

func process(p dataProcessor, data []int) {
	loaded := p.load(data)
	transformed := p.transform(loaded)
	p.output(transformed)
}

type baseProcessor struct{}

func (baseProcessor) load(data []int) []int {
	return data
}

type doublingProcessor struct {
	baseProcessor
}

func (doublingProcessor) transform(data []int) []int {
	out := make([]int, len(data))
	for i, v := range data {
		out[i] = v * 2
	}
	return out
}

func (doublingProcessor) output(data []int) {
	fmt.Println("doubled:", data)
}

type sumProcessor struct {
	baseProcessor
}

func (sumProcessor) transform(data []int) []int {
	total := 0
	for _, v := range data {
		total += v
	}
	return []int{total}
}

func (sumProcessor) output(data []int) {
	fmt.Println("sum:", data[0])
}

func main() {
	data := []int{1, 2, 3, 4, 5}
	process(doublingProcessor{}, data)
	process(sumProcessor{}, data)
}
