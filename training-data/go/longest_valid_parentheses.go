package main

import "fmt"

func longestValid(s string) int {
	stack := []int{-1}
	best := 0
	for i, c := range s {
		if c == '(' {
			stack = append(stack, i)
			continue
		}
		stack = stack[:len(stack)-1]
		if len(stack) == 0 {
			stack = append(stack, i)
		} else if l := i - stack[len(stack)-1]; l > best {
			best = l
		}
	}
	return best
}

func main() {
	for _, s := range []string{"(()", ")()())", "", "()(()", "((()))()"} {
		fmt.Printf("%q %d\n", s, longestValid(s))
	}
}
