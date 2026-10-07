package main

import (
	"fmt"
	"strconv"
	"strings"
)

func runLengthEncode(s string) string {
	if len(s) == 0 {
		return ""
	}
	var sb strings.Builder
	count := 1
	for i := 1; i < len(s); i++ {
		if s[i] == s[i-1] {
			count++
		} else {
			sb.WriteByte(s[i-1])
			sb.WriteString(strconv.Itoa(count))
			count = 1
		}
	}
	sb.WriteByte(s[len(s)-1])
	sb.WriteString(strconv.Itoa(count))
	return sb.String()
}

func main() {
	fmt.Println(runLengthEncode("aaabbbcccd"))
	fmt.Println(runLengthEncode("wwwwaaadexxxxxx"))
}
