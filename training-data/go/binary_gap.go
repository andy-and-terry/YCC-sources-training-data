package main

import "fmt"

func binaryGap(n uint) int {
	best, last := 0, -1
	for i := 0; n > 0; i, n = i+1, n>>1 {
		if n&1 == 1 {
			if last >= 0 && i-last-1 > best {
				best = i - last - 1
			}
			last = i
		}
	}
	return best
}

func main() {
	for _, n := range []uint{9, 529, 20, 15, 1041} {
		fmt.Printf("%d %b %d\n", n, n, binaryGap(n))
	}
}
