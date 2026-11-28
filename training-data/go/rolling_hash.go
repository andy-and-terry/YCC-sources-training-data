package main

import "fmt"

func main() {
	s := "abcabc"
	const k, B, M = 3, 31, 1000003
	pw, h := 1, 0
	for i := 1; i < k; i++ {
		pw = pw * B % M
	}
	for i := 0; i < k; i++ {
		h = (h*B + int(s[i])) % M
	}
	fmt.Println(0, h)
	for i := 1; i+k <= len(s); i++ {
		h = (h - int(s[i-1])*pw%M + M) % M
		h = (h*B + int(s[i+k-1])) % M
		fmt.Println(i, h)
	}
}
