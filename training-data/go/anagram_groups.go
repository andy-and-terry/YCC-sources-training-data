package main

import (
	"fmt"
	"sort"
	"strings"
)

func groupAnagrams(words []string) [][]string {
	groups := make(map[string][]string)
	for _, word := range words {
		chars := strings.Split(word, "")
		sort.Strings(chars)
		key := strings.Join(chars, "")
		groups[key] = append(groups[key], word)
	}
	var result [][]string
	for _, group := range groups {
		result = append(result, group)
	}
	return result
}

func main() {
	fmt.Println(groupAnagrams([]string{"eat", "tea", "tan", "ate", "nat", "bat"}))
}
