package main

import (
	"bytes"
	"fmt"
	"sync"
)

var bufPool = sync.Pool{
	New: func() any { return new(bytes.Buffer) },
}

func render(name string) string {
	buf := bufPool.Get().(*bytes.Buffer)
	defer func() {
		buf.Reset()
		bufPool.Put(buf)
	}()
	fmt.Fprintf(buf, "hello, %s", name)
	return buf.String()
}

func main() {
	fmt.Println(render("gopher"))
	fmt.Println(render("pool"))
}
