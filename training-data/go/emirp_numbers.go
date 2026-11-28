package main

import "fmt"

func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func reverse(n int) int {
	r := 0
	for ; n > 0; n /= 10 {
		r = r*10 + n%10
	}
	return r
}

func main() {
	for p := 2; p < 200; p++ {
		if r := reverse(p); r != p && isPrime(p) && isPrime(r) {
			fmt.Print(p, " ")
		}
	}
	fmt.Println() // 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
}
