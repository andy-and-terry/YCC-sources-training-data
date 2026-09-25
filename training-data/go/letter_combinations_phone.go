package main

import "fmt"

var keypad = map[byte]string{'2': "abc", '3': "def", '4': "ghi", '5': "jkl", '6': "mno", '7': "pqrs", '8': "tuv", '9': "wxyz"}

func letterCombinations(digits string) []string {
	if digits == "" {
		return nil
	}
	out := []string{""}
	for i := 0; i < len(digits); i++ {
		var next []string
		for _, prefix := range out {
			for _, c := range keypad[digits[i]] {
				next = append(next, prefix+string(c))
			}
		}
		out = next
	}
	return out
}

func main() {
	fmt.Println(letterCombinations("23"))
	fmt.Println(len(letterCombinations("7979")))
}
