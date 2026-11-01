package main

import (
	"bytes"
	"fmt"
	"strings"
)

func main() {
	var b strings.Builder
	for i := 0; i < 3; i++ {
		fmt.Fprintf(&b, "item-%d;", i)
	}
	fmt.Println(b.String())

	var buf bytes.Buffer
	buf.WriteString("hello ")
	buf.Write([]byte("world"))
	fmt.Println(buf.Len(), buf.String())
}
