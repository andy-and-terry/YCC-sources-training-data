package main

import (
	"bytes"
	"fmt"
	"sync"
)

var pool = sync.Pool{New: func() any { return new(bytes.Buffer) }}

func render(s string) string {
	b := pool.Get().(*bytes.Buffer)
	defer pool.Put(b)
	b.Reset()
	b.WriteString("<" + s + ">")
	return b.String()
}

func main() { fmt.Println(render("x"), render("y")) }
