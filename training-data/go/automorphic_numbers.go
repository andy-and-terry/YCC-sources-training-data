package main

import "fmt"

func isAutomorphic(n int) bool {
	sq := n * n
	for m := n; ; m /= 10 {
		if m%10 != sq%10 {
			return false
		}
		sq /= 10
		if m < 10 {
			return true
		}
	}
}

func main() {
	for n := 0; n < 1000; n++ {
		if isAutomorphic(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println() // 0 1 5 6 25 76 376 625
}
