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

func main() {
	found := []int{}
	for p := 2; len(found) < 10; p++ {
		if isPrime(p) && isPrime(2*p+1) {
			found = append(found, p)
		}
	}
	fmt.Println(found) // [2 3 5 11 23 29 41 53 83 89]
}
