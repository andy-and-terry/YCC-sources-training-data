package main

import (
	"encoding/hex"
	"fmt"
)

func main() {
	data := []byte("Hello, Go hex dump!\nTabs\tand bytes \x00\x01\xff")
	fmt.Print(hex.Dump(data))

	for off := 0; off < len(data); off += 8 {
		end := min(off+8, len(data))
		fmt.Printf("%04x  % x\n", off, data[off:end])
	}
}
