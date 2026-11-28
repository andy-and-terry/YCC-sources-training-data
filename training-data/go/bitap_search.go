package main

import "fmt"

func bitap(text, pat string) int {
	var masks [256]uint64
	for i := 0; i < len(pat); i++ {
		masks[pat[i]] |= 1 << uint(i)
	}
	var state uint64
	goal := uint64(1) << uint(len(pat)-1)
	for i := 0; i < len(text); i++ {
		state = ((state << 1) | 1) & masks[text[i]]
		if state&goal != 0 {
			return i - len(pat) + 1
		}
	}
	return -1
}

func main() { fmt.Println(bitap("the quick brown fox", "brown")) }
