package main

import (
	"bufio"
	"fmt"
	"strings"
)

// bufio.Scanner with ScanWords splits input on whitespace.
func main() {
	input := "the quick  brown\nfox jumps\tover the lazy dog"
	scanner := bufio.NewScanner(strings.NewReader(input))
	scanner.Split(bufio.ScanWords)

	counts := map[string]int{}
	for scanner.Scan() {
		counts[scanner.Text()]++
	}
	fmt.Println(len(counts), counts["the"])
}
