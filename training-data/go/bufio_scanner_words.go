package main

import (
	"bufio"
	"fmt"
	"strings"
)

func main() {
	sc := bufio.NewScanner(strings.NewReader("one two  three\nfour"))
	sc.Split(bufio.ScanWords)
	n := 0
	for sc.Scan() {
		n++
	}
	fmt.Println(n)
}
