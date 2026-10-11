package main

import (
	"fmt"
	"strings"
)

type Reader interface{ Read() string }
type Writer interface{ Write(s string) }
type ReadWriter interface {
	Reader
	Writer
}

type MemFile struct{ sb strings.Builder }

func (m *MemFile) Read() string   { return m.sb.String() }
func (m *MemFile) Write(s string) { m.sb.WriteString(s) }

type CountingWriter struct {
	Writer
	Count int
}

func (c *CountingWriter) Write(s string) {
	c.Count += len(s)
	c.Writer.Write(s)
}

func main() {
	f := &MemFile{}
	var rw ReadWriter = f
	cw := &CountingWriter{Writer: rw}
	cw.Write("hello ")
	cw.Write("world")
	fmt.Println(rw.Read(), cw.Count)
}
