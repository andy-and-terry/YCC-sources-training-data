package main

import (
	"bytes"
	"crypto/sha256"
	"fmt"
	"io"
	"os"
	"strings"
)

func main() {
	pr, pw := io.Pipe()
	go func() {
		defer pw.Close()
		fmt.Fprint(pw, "through the pipe")
	}()
	data, _ := io.ReadAll(pr)
	fmt.Println(string(data))

	h := sha256.New()
	tee := io.TeeReader(strings.NewReader("tee me"), h)
	var sink bytes.Buffer
	io.Copy(&sink, tee)
	fmt.Printf("%s %x\n", sink.String(), h.Sum(nil)[:4])

	mw := io.MultiWriter(os.Stdout, &sink)
	fmt.Fprintln(mw, "to both")
	fmt.Println(sink.Len())
	lr := io.LimitReader(strings.NewReader("0123456789"), 4)
	b, _ := io.ReadAll(lr)
	fmt.Println(string(b))
}
