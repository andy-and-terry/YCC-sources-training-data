package main

import "fmt"

func wordLadderLength(begin, end string, wordList []string) int {
	wordSet := make(map[string]bool)
	for _, w := range wordList {
		wordSet[w] = true
	}
	if !wordSet[end] {
		return 0
	}

	queue := []string{begin}
	steps := 1
	for len(queue) > 0 {
		next := []string{}
		for _, word := range queue {
			if word == end {
				return steps
			}
			bytes := []byte(word)
			for i := 0; i < len(bytes); i++ {
				original := bytes[i]
				for c := byte('a'); c <= 'z'; c++ {
					if c == original {
						continue
					}
					bytes[i] = c
					candidate := string(bytes)
					if wordSet[candidate] {
						delete(wordSet, candidate)
						next = append(next, candidate)
					}
				}
				bytes[i] = original
			}
		}
		queue = next
		steps++
	}
	return 0
}

func main() {
	words := []string{"hot", "dot", "dog", "lot", "log", "cog"}
	fmt.Println("ladder length:", wordLadderLength("hit", "cog", words))
}
