package main

import (
	"encoding/hex"
	"fmt"
)

func main() {
	src := []byte("Gopher\x00\xff")
	s := hex.EncodeToString(src)
	fmt.Println(s)

	back, err := hex.DecodeString(s)
	fmt.Println(back, err)

	_, err = hex.DecodeString("zz")
	fmt.Println("error:", err)

	fmt.Print(hex.Dump([]byte("hello, hex dump!")))
}
