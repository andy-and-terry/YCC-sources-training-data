package main

import (
	"fmt"
	"strings"
)

func justify(words []string, width int) []string {
	var lines []string
	for i := 0; i < len(words); {
		j, length := i, 0
		for j < len(words) && length+len(words[j])+(j-i) <= width {
			length += len(words[j])
			j++
		}
		gaps := j - i - 1
		var b strings.Builder
		if j == len(words) || gaps == 0 {
			b.WriteString(strings.Join(words[i:j], " "))
			b.WriteString(strings.Repeat(" ", width-b.Len()))
		} else {
			spaces, extra := (width-length)/gaps, (width-length)%gaps
			for k := i; k < j-1; k++ {
				b.WriteString(words[k])
				n := spaces
				if k-i < extra {
					n++
				}
				b.WriteString(strings.Repeat(" ", n))
			}
			b.WriteString(words[j-1])
		}
		lines = append(lines, b.String())
		i = j
	}
	return lines
}

func main() {
	for _, l := range justify(strings.Fields("This is an example of text justification done greedily line by line"), 20) {
		fmt.Printf("[%s]\n", l)
	}
}
