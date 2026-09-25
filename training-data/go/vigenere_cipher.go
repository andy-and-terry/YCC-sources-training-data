package main

import (
	"fmt"
	"strings"
	"unicode"
)

type vigenere struct{ shifts []int }

func newVigenere(key string) vigenere {
	var s []int
	for _, r := range strings.ToLower(key) {
		if r >= 'a' && r <= 'z' {
			s = append(s, int(r-'a'))
		}
	}
	return vigenere{s}
}

func (v vigenere) apply(text string, dir int) string {
	k := 0
	return strings.Map(func(r rune) rune {
		if r > unicode.MaxASCII || !unicode.IsLetter(r) {
			return r
		}
		base := 'a'
		if unicode.IsUpper(r) {
			base = 'A'
		}
		shift := v.shifts[k%len(v.shifts)] * dir
		k++
		return base + ((r-base+rune(shift))%26+26)%26
	}, text)
}

func main() {
	v := newVigenere("LEMON")
	c := v.apply("Attack at dawn!", 1)
	fmt.Println(c, "->", v.apply(c, -1))
}
