package main

import "fmt"

type Reader interface{ Read() string }
type Writer interface{ Write(s string) }
type ReadWriter interface {
	Reader
	Writer
}

type Buf struct{ data string }

func (b *Buf) Read() string   { return b.data }
func (b *Buf) Write(s string) { b.data += s }

func main() {
	var rw ReadWriter = &Buf{}
	rw.Write("hi")
	fmt.Println(rw.Read())
}
