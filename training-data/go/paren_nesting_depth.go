// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
package main

import "fmt"

func maxDepth(s string) int {
	depth, best := 0, 0
	for _, ch := range s {
		switch ch {
		case '(':
			depth++
			best = max(best, depth)
		case ')':
			depth--
			if depth < 0 {
				return -1
			}
		}
	}
	if depth != 0 {
		return -1
	}
	return best
}

func main() {
	fmt.Println(maxDepth("(1+(2*(3)))"), maxDepth("(()"))
}
