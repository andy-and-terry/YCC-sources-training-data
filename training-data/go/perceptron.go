package main

import (
	"fmt"
	"math/rand"
)

type perceptron struct {
	weights      []float64
	bias         float64
	learningRate float64
}

func newPerceptron(inputSize int, learningRate float64, r *rand.Rand) *perceptron {
	weights := make([]float64, inputSize)
	for i := range weights {
		weights[i] = r.Float64()*2 - 1
	}
	return &perceptron{weights: weights, bias: r.Float64()*2 - 1, learningRate: learningRate}
}

func (p *perceptron) activate(x float64) int {
	if x >= 0 {
		return 1
	}
	return 0
}

func (p *perceptron) predict(inputs []float64) int {
	total := p.bias
	for i, x := range inputs {
		total += p.weights[i] * x
	}
	return p.activate(total)
}

func (p *perceptron) train(inputs []float64, target int) {
	prediction := p.predict(inputs)
	err := float64(target - prediction)
	for i, x := range inputs {
		p.weights[i] += p.learningRate * err * x
	}
	p.bias += p.learningRate * err
}

func main() {
	r := rand.New(rand.NewSource(1))
	type sample struct {
		inputs []float64
		target int
	}
	data := []sample{
		{[]float64{0, 0}, 0},
		{[]float64{0, 1}, 0},
		{[]float64{1, 0}, 0},
		{[]float64{1, 1}, 1},
	}
	p := newPerceptron(2, 0.1, r)
	for epoch := 0; epoch < 100; epoch++ {
		for _, s := range data {
			p.train(s.inputs, s.target)
		}
	}
	for _, s := range data {
		fmt.Println(s.inputs, p.predict(s.inputs), s.target)
	}
}
