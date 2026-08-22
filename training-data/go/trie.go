package main

import "fmt"

type trieNode struct {
	children map[byte]*trieNode
	isWord   bool
}

func newTrieNode() *trieNode {
	return &trieNode{children: make(map[byte]*trieNode)}
}

type trie struct {
	root *trieNode
}

func newTrie() *trie {
	return &trie{root: newTrieNode()}
}

func (t *trie) insert(word string) {
	node := t.root
	for i := 0; i < len(word); i++ {
		ch := word[i]
		if node.children[ch] == nil {
			node.children[ch] = newTrieNode()
		}
		node = node.children[ch]
	}
	node.isWord = true
}

func (t *trie) find(s string) *trieNode {
	node := t.root
	for i := 0; i < len(s); i++ {
		node = node.children[s[i]]
		if node == nil {
			return nil
		}
	}
	return node
}

func (t *trie) search(word string) bool {
	node := t.find(word)
	return node != nil && node.isWord
}

func (t *trie) startsWith(prefix string) bool {
	return t.find(prefix) != nil
}

func main() {
	tr := newTrie()
	for _, word := range []string{"cat", "car", "card", "care"} {
		tr.insert(word)
	}
	fmt.Println(tr.search("car"), tr.search("ca"), tr.startsWith("ca"))
}
