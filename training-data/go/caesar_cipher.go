package main

import "fmt"

func encrypt(text string, shift int) string {
	result := []rune(text)
	for i, ch := range result {
		switch {
		case ch >= 'a' && ch <= 'z':
			result[i] = 'a' + (ch-'a'+rune(shift)%26+26)%26
		case ch >= 'A' && ch <= 'Z':
			result[i] = 'A' + (ch-'A'+rune(shift)%26+26)%26
		}
	}
	return string(result)
}

func decrypt(text string, shift int) string {
	return encrypt(text, -shift)
}

func main() {
	cipher := encrypt("Hello, World!", 3)
	fmt.Println(cipher)
	fmt.Println(decrypt(cipher, 3))
}
