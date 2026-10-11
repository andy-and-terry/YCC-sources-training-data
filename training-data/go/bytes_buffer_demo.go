package main

import (
	"bytes"
	"fmt"
	"io"
)

func main() {
	var buf bytes.Buffer
	buf.WriteString("hello, ")
	buf.Write([]byte("world"))
	buf.WriteByte('!')
	fmt.Fprintf(&buf, " n=%d", 42)
	fmt.Println(buf.String(), buf.Len())

	head := make([]byte, 5)
	n, _ := buf.Read(head)
	fmt.Printf("read %d bytes: %s\n", n, head)

	rest, _ := io.ReadAll(&buf)
	fmt.Printf("rest: %q\n", rest)

	fmt.Println(bytes.Contains([]byte("seafood"), []byte("foo")))
	fmt.Println(bytes.ToUpper([]byte("abc")))
	fmt.Printf("%s\n", bytes.Fields([]byte(" a  b c ")))
}
