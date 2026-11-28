package main

import "fmt"

func fletcher16(data []byte) uint16 {
	var s1, s2 uint16
	for _, b := range data {
		s1 = (s1 + uint16(b)) % 255
		s2 = (s2 + s1) % 255
	}
	return s2<<8 | s1
}

func main() {
	fmt.Printf("%#x\n", fletcher16([]byte("abcde")))
}
