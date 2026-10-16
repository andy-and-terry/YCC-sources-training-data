package main

import (
	"bufio"
	"fmt"
	"strings"
)

func main() {
	text := "the quick brown fox\njumps over the lazy dog"
	sc := bufio.NewScanner(strings.NewReader(text))
	sc.Split(bufio.ScanWords)
	counts := map[string]int{}
	total := 0
	for sc.Scan() {
		counts[sc.Text()]++
		total++
	}
	fmt.Println("words:", total, "the:", counts["the"])

	rs := bufio.NewScanner(strings.NewReader("héy"))
	rs.Split(bufio.ScanRunes)
	for rs.Scan() {
		fmt.Printf("%q ", rs.Text())
	}
	fmt.Println()
}
