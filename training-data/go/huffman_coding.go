package main

import (
	"container/heap"
	"fmt"
)

type huffmanNode struct {
	char        rune
	hasChar     bool
	freq        int
	left, right *huffmanNode
}

type nodeHeap []*huffmanNode

func (h nodeHeap) Len() int            { return len(h) }
func (h nodeHeap) Less(i, j int) bool  { return h[i].freq < h[j].freq }
func (h nodeHeap) Swap(i, j int)       { h[i], h[j] = h[j], h[i] }
func (h *nodeHeap) Push(x interface{}) { *h = append(*h, x.(*huffmanNode)) }
func (h *nodeHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[:n-1]
	return x
}

func buildTree(text string) *huffmanNode {
	counts := make(map[rune]int)
	for _, ch := range text {
		counts[ch]++
	}
	h := &nodeHeap{}
	heap.Init(h)
	for ch, freq := range counts {
		heap.Push(h, &huffmanNode{char: ch, hasChar: true, freq: freq})
	}
	for h.Len() > 1 {
		a := heap.Pop(h).(*huffmanNode)
		b := heap.Pop(h).(*huffmanNode)
		heap.Push(h, &huffmanNode{freq: a.freq + b.freq, left: a, right: b})
	}
	return heap.Pop(h).(*huffmanNode)
}

func buildCodes(node *huffmanNode, prefix string, codes map[rune]string) {
	if node.hasChar {
		if prefix == "" {
			prefix = "0"
		}
		codes[node.char] = prefix
		return
	}
	buildCodes(node.left, prefix+"0", codes)
	buildCodes(node.right, prefix+"1", codes)
}

func encode(text string) string {
	codes := make(map[rune]string)
	buildCodes(buildTree(text), "", codes)
	result := ""
	for _, ch := range text {
		result += codes[ch]
	}
	return result
}

func main() {
	fmt.Println(encode("abracadabra"))
}
