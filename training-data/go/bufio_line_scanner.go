package main

import (
	"bufio"
	"fmt"
	"strings"
)

func main() {
	text := "first line\nsecond line\nthird line"
	scanner := bufio.NewScanner(strings.NewReader(text))

	lineNum := 0
	for scanner.Scan() {
		lineNum++
		fmt.Printf("%d: %s\n", lineNum, scanner.Text())
	}
	if err := scanner.Err(); err != nil {
		fmt.Println("scan error:", err)
	}

	wordScanner := bufio.NewScanner(strings.NewReader("go is fun to learn"))
	wordScanner.Split(bufio.ScanWords)
	count := 0
	for wordScanner.Scan() {
		count++
	}
	fmt.Println("word count:", count)
}
