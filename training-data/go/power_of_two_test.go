package main

import "fmt"

func isPowerOfTwo(n int) bool { return n > 0 && n&(n-1) == 0 }

func main() {
	for n := 1; n < 40; n++ {
		if isPowerOfTwo(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
