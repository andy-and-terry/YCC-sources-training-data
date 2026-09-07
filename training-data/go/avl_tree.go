package main

import "fmt"

type avlNode struct {
	value       int
	height      int
	left, right *avlNode
}

func height(n *avlNode) int {
	if n == nil {
		return 0
	}
	return n.height
}

func maxInt(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func updateHeight(n *avlNode) {
	n.height = 1 + maxInt(height(n.left), height(n.right))
}

func balanceFactor(n *avlNode) int {
	if n == nil {
		return 0
	}
	return height(n.left) - height(n.right)
}

func rotateRight(y *avlNode) *avlNode {
	x := y.left
	t2 := x.right
	x.right = y
	y.left = t2
	updateHeight(y)
	updateHeight(x)
	return x
}

func rotateLeft(x *avlNode) *avlNode {
	y := x.right
	t2 := y.left
	y.left = x
	x.right = t2
	updateHeight(x)
	updateHeight(y)
	return y
}

func avlInsert(node *avlNode, value int) *avlNode {
	if node == nil {
		return &avlNode{value: value, height: 1}
	}
	if value < node.value {
		node.left = avlInsert(node.left, value)
	} else if value > node.value {
		node.right = avlInsert(node.right, value)
	} else {
		return node
	}

	updateHeight(node)
	balance := balanceFactor(node)

	if balance > 1 && value < node.left.value {
		return rotateRight(node)
	}
	if balance < -1 && value > node.right.value {
		return rotateLeft(node)
	}
	if balance > 1 && value > node.left.value {
		node.left = rotateLeft(node.left)
		return rotateRight(node)
	}
	if balance < -1 && value < node.right.value {
		node.right = rotateRight(node.right)
		return rotateLeft(node)
	}
	return node
}

func inorder(node *avlNode, result *[]int) {
	if node == nil {
		return
	}
	inorder(node.left, result)
	*result = append(*result, node.value)
	inorder(node.right, result)
}

func main() {
	var root *avlNode
	for _, v := range []int{10, 20, 30, 40, 50, 25} {
		root = avlInsert(root, v)
	}
	var result []int
	inorder(root, &result)
	fmt.Println(result)
	fmt.Println("root:", root.value, "height:", root.height)
}
