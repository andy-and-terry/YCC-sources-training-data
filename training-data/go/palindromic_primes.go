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

func isPalindrome(n int) bool {
	r := 0
	for m := n; m > 0; m /= 10 {
		r = r*10 + m%10
	}
	return r == n
}

func main() {
	for n := 0; n < 200; n++ {
		if isPalindrome(n) && isPrime(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println() // 2 3 5 7 11 101 131 151 181 191
}
