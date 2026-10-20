package main

import (
	"fmt"
	"unsafe"
)

type padded struct {
	a bool
	b int64
	c bool
}

type packed struct {
	b int64
	a bool
	c bool
}

func main() {
	fmt.Println(unsafe.Sizeof(padded{}), unsafe.Sizeof(packed{}))
	fmt.Println(unsafe.Alignof(int64(0)), unsafe.Offsetof(padded{}.c))
	s := "hello"
	b := unsafe.Slice(unsafe.StringData(s), len(s))
	fmt.Println(b[1], string(b))
}
