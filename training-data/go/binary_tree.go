package main

import "fmt"

type Node struct {
	value       int
	left, right *Node
}

type BinaryTree struct {
	root *Node
}

func (t *BinaryTree) Insert(value int) {
	t.root = insert(t.root, value)
}

func insert(node *Node, value int) *Node {
	if node == nil {
		return &Node{value: value}
	}
	if value < node.value {
		node.left = insert(node.left, value)
	} else {
		node.right = insert(node.right, value)
	}
	return node
}

func (t *BinaryTree) InOrder() []int {
	var result []int
	inOrder(t.root, &result)
	return result
}

func inOrder(node *Node, result *[]int) {
	if node == nil {
		return
	}
	inOrder(node.left, result)
	*result = append(*result, node.value)
	inOrder(node.right, result)
}

func main() {
	tree := &BinaryTree{}
	for _, v := range []int{5, 3, 8, 1, 4, 7, 9} {
		tree.Insert(v)
	}
	fmt.Println(tree.InOrder())
}
