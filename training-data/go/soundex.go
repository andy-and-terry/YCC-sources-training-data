package main

import (
	"fmt"
	"strings"
)

func soundex(word string) string {
	codes := map[rune]byte{
		'b': '1', 'f': '1', 'p': '1', 'v': '1',
		'c': '2', 'g': '2', 'j': '2', 'k': '2', 'q': '2', 's': '2', 'x': '2', 'z': '2',
		'd': '3', 't': '3', 'l': '4', 'm': '5', 'n': '5', 'r': '6',
	}
	w := []rune(strings.ToLower(word))
	if len(w) == 0 {
		return ""
	}
	out := []byte{byte(strings.ToUpper(string(w[0]))[0])}
	last := codes[w[0]]
	for _, ch := range w[1:] {
		code := codes[ch]
		if code != 0 && code != last {
			out = append(out, code)
		}
		if ch != 'h' && ch != 'w' {
			last = code
		}
	}
	return (string(out) + "000")[:4]
}

func main() {
	for _, n := range []string{"Robert", "Rupert", "Tymczak", "Pfister", "Honeyman"} {
		fmt.Println(n, soundex(n))
	}
}
