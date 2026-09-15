package main

import (
	"fmt"
	"sort"
	"strings"
)

type wordCount struct {
	word  string
	count int
}

func wordFrequency(text string) []wordCount {
	counts := make(map[string]int)
	for _, word := range strings.Fields(strings.ToLower(text)) {
		word = strings.Trim(word, ".,!?;:")
		if word != "" {
			counts[word]++
		}
	}
	result := make([]wordCount, 0, len(counts))
	for word, count := range counts {
		result = append(result, wordCount{word, count})
	}
	sort.Slice(result, func(i, j int) bool {
		if result[i].count != result[j].count {
			return result[i].count > result[j].count
		}
		return result[i].word < result[j].word
	})
	return result
}

func main() {
	text := "the quick brown fox jumps over the lazy dog. The dog barks."
	for _, wc := range wordFrequency(text) {
		fmt.Printf("%s: %d\n", wc.word, wc.count)
	}
}
