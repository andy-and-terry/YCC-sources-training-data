package main

import (
	"fmt"
	"strings"
)

var morse = map[rune]string{
	'A': ".-", 'B': "-...", 'C': "-.-.", 'D': "-..", 'E': ".", 'F': "..-.", 'G': "--.", 'H': "....",
	'I': "..", 'J': ".---", 'K': "-.-", 'L': ".-..", 'M': "--", 'N': "-.", 'O': "---", 'P': ".--.",
	'Q': "--.-", 'R': ".-.", 'S': "...", 'T': "-", 'U': "..-", 'V': "...-", 'W': ".--", 'X': "-..-",
	'Y': "-.--", 'Z': "--..", '0': "-----", '1': ".----", '2': "..---", '3': "...--", '4': "....-",
	'5': ".....", '6': "-....", '7': "--...", '8': "---..", '9': "----.",
}

func encode(text string) string {
	var words []string
	for _, w := range strings.Fields(strings.ToUpper(text)) {
		var codes []string
		for _, r := range w {
			if c, ok := morse[r]; ok {
				codes = append(codes, c)
			}
		}
		words = append(words, strings.Join(codes, " "))
	}
	return strings.Join(words, " / ")
}

func decode(code string) string {
	rev := make(map[string]rune, len(morse))
	for k, v := range morse {
		rev[v] = k
	}
	var words []string
	for _, w := range strings.Split(code, " / ") {
		var b strings.Builder
		for _, sym := range strings.Fields(w) {
			if r, ok := rev[sym]; ok {
				b.WriteRune(r)
			} else {
				b.WriteRune('?')
			}
		}
		words = append(words, b.String())
	}
	return strings.Join(words, " ")
}

func main() {
	m := encode("SOS help 2024")
	fmt.Println(m)
	fmt.Println(decode(m))
}
