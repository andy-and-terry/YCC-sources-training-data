package main

import (
	"fmt"
	"unicode/utf16"
	"unicode/utf8"
)

func main() {
	s := "a😀é"
	fmt.Println(len(s), utf8.RuneCountInString(s))
	u := utf16.Encode([]rune(s))
	fmt.Printf("%04x\n", u)
	fmt.Println(string(utf16.Decode(u)))
	r1, r2 := utf16.EncodeRune('😀')
	fmt.Printf("%x %x\n", r1, r2)
	fmt.Println(utf8.ValidString("ok"), utf8.ValidString("\xff"))
	b := utf8.AppendRune(nil, 'é')
	fmt.Println(b)
}
