package main

import (
	"fmt"
	"sort"
)

type acNode struct {
	children map[byte]*acNode
	isWord   bool
}

func newACNode() *acNode {
	return &acNode{children: make(map[byte]*acNode)}
}

type autocomplete struct {
	root *acNode
}

func newAutocomplete(words []string) *autocomplete {
	ac := &autocomplete{root: newACNode()}
	for _, word := range words {
		ac.insert(word)
	}
	return ac
}

func (ac *autocomplete) insert(word string) {
	node := ac.root
	for i := 0; i < len(word); i++ {
		ch := word[i]
		if node.children[ch] == nil {
			node.children[ch] = newACNode()
		}
		node = node.children[ch]
	}
	node.isWord = true
}

func (ac *autocomplete) suggestions(prefix string) []string {
	node := ac.root
	for i := 0; i < len(prefix); i++ {
		node = node.children[prefix[i]]
		if node == nil {
			return nil
		}
	}
	var results []string
	var collect func(n *acNode, path string)
	collect = func(n *acNode, path string) {
		if n.isWord {
			results = append(results, prefix+path)
		}
		for ch, child := range n.children {
			collect(child, path+string(ch))
		}
	}
	collect(node, "")
	sort.Strings(results)
	return results
}

func main() {
	ac := newAutocomplete([]string{"cat", "car", "card", "care", "dog"})
	fmt.Println(ac.suggestions("ca"))
}
