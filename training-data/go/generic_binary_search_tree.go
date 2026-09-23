package main

import "fmt"

type Ordered interface {
	~int | ~int64 | ~float64 | ~string
}

type bstNode[T Ordered] struct {
	value       T
	left, right *bstNode[T]
}

type BST[T Ordered] struct {
	root *bstNode[T]
}

func (t *BST[T]) Insert(value T) {
	t.root = insertBST(t.root, value)
}

func insertBST[T Ordered](node *bstNode[T], value T) *bstNode[T] {
	if node == nil {
		return &bstNode[T]{value: value}
	}
	if value < node.value {
		node.left = insertBST(node.left, value)
	} else if value > node.value {
		node.right = insertBST(node.right, value)
	}
	return node
}

func (t *BST[T]) Contains(value T) bool {
	node := t.root
	for node != nil {
		if value == node.value {
			return true
		}
		if value < node.value {
			node = node.left
		} else {
			node = node.right
		}
	}
	return false
}

func (t *BST[T]) InOrder() []T {
	var result []T
	var walk func(*bstNode[T])
	walk = func(n *bstNode[T]) {
		if n == nil {
			return
		}
		walk(n.left)
		result = append(result, n.value)
		walk(n.right)
	}
	walk(t.root)
	return result
}

func main() {
	var tree BST[int]
	for _, v := range []int{5, 2, 8, 1, 9, 3} {
		tree.Insert(v)
	}
	fmt.Println(tree.InOrder())
	fmt.Println(tree.Contains(8), tree.Contains(4))

	var words BST[string]
	for _, w := range []string{"pear", "apple", "cherry"} {
		words.Insert(w)
	}
	fmt.Println(words.InOrder())
}
