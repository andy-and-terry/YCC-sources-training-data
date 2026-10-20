package main

import (
	"bufio"
	"fmt"
	"io"
	"strings"
)

func main() {
	r := bufio.NewReader(strings.NewReader("first line\nsecond line\nno newline"))
	for {
		line, err := r.ReadString('\n')
		fmt.Printf("%q\n", line)
		if err == io.EOF {
			break
		}
	}
	r2 := bufio.NewReader(strings.NewReader("héllo"))
	ch, size, _ := r2.ReadRune()
	ch2, size2, _ := r2.ReadRune()
	fmt.Println(string(ch), size, string(ch2), size2)
	peek, _ := r2.Peek(2)
	fmt.Println(string(peek))
}
