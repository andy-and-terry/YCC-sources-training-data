package main

import (
	"fmt"
	"slices"
)

func longestCommonPrefix(words []string) string {
	if len(words) == 0 {
		return ""
	}
	lo, hi := slices.Min(words), slices.Max(words)
	i := 0
	for i < len(lo) && lo[i] == hi[i] {
		i++
	}
	return lo[:i]
}

func main() {
	fmt.Printf("%q\n", longestCommonPrefix([]string{"flower", "flow", "flight"}))
	fmt.Printf("%q\n", longestCommonPrefix([]string{"dog", "racecar", "car"}))
	fmt.Printf("%q\n", longestCommonPrefix([]string{"interspecies", "interstellar", "interstate"}))
}
