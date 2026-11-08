package main

import "fmt"

func rot47(s string) string {
	out := []byte(s)
	for i, c := range out {
		if c >= 33 && c <= 126 {
			out[i] = 33 + (c-33+47)%94
		}
	}
	return string(out)
}

func main() {
	e := rot47("Hello, World!")
	fmt.Println(e, rot47(e))
}
