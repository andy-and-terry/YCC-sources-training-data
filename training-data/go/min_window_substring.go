package main

import (
	"fmt"
	"math"
)

func minWindow(s, t string) string {
	var need [256]int
	for i := 0; i < len(t); i++ {
		need[t[i]]++
	}
	missing, bestL, bestLen := len(t), 0, math.MaxInt
	for l, r := 0, 0; r < len(s); r++ {
		if need[s[r]] > 0 {
			missing--
		}
		need[s[r]]--
		for missing == 0 {
			if r-l+1 < bestLen {
				bestL, bestLen = l, r-l+1
			}
			need[s[l]]++
			if need[s[l]] > 0 {
				missing++
			}
			l++
		}
	}
	if bestLen == math.MaxInt {
		return ""
	}
	return s[bestL : bestL+bestLen]
}

func main() {
	fmt.Printf("%q %q\n", minWindow("ADOBECODEBANC", "ABC"), minWindow("a", "aa"))
}
