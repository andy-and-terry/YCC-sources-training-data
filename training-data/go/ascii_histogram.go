package main

import (
	"fmt"
	"sort"
	"strings"
)

func histogram(s string, width int) string {
	counts := map[rune]int{}
	peak := 0
	for _, r := range s {
		counts[r]++
		peak = max(peak, counts[r])
	}
	keys := make([]rune, 0, len(counts))
	for k := range counts {
		keys = append(keys, k)
	}
	sort.Slice(keys, func(i, j int) bool { return keys[i] < keys[j] })
	var b strings.Builder
	for _, k := range keys {
		bar := max(1, counts[k]*width/peak)
		fmt.Fprintf(&b, "%c | %s %d\n", k, strings.Repeat("#", bar), counts[k])
	}
	return b.String()
}

func main() {
	fmt.Print(histogram("theraininspainfallsmainlyontheplain", 30))
}
