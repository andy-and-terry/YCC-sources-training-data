package main

import (
	"fmt"
	"io"
	"strings"
)

type upperWriter struct {
	target io.Writer
}

func (w *upperWriter) Write(p []byte) (int, error) {
	return w.target.Write([]byte(strings.ToUpper(string(p))))
}

type countingReader struct {
	source io.Reader
	count  int
}

func (r *countingReader) Read(p []byte) (int, error) {
	n, err := r.source.Read(p)
	r.count += n
	return n, err
}

func main() {
	var sb strings.Builder
	uw := &upperWriter{target: &sb}

	cr := &countingReader{source: strings.NewReader("hello, generic reader and writer")}

	n, err := io.Copy(uw, cr)
	if err != nil {
		fmt.Println("copy error:", err)
		return
	}

	fmt.Println(sb.String())
	fmt.Println("bytes copied:", n)
	fmt.Println("bytes read:", cr.count)
}
