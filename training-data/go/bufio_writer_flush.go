package main

import (
	"bufio"
	"bytes"
	"fmt"
)

// bufio.Writer batches small writes; nothing reaches the underlying
// writer until the buffer fills or Flush is called.
type countingWriter struct {
	buf    bytes.Buffer
	writes int
}

func (c *countingWriter) Write(p []byte) (int, error) {
	c.writes++
	return c.buf.Write(p)
}

func main() {
	dst := &countingWriter{}
	w := bufio.NewWriterSize(dst, 16)

	for i := 0; i < 3; i++ {
		fmt.Fprintf(w, "line %d\n", i)
	}
	fmt.Println("buffered:", w.Buffered(), "underlying writes:", dst.writes)

	w.Flush()
	fmt.Println("after flush:", w.Buffered(), "underlying writes:", dst.writes)
	fmt.Printf("%q\n", dst.buf.String())
}
