package main

import "fmt"

func cake(n int) int { return (n*n*n + 5*n + 6) / 6 }

func main() {
	for n := 0; n < 10; n++ {
		fmt.Print(cake(n), " ")
	}
	fmt.Println() // 1 2 4 8 15 26 42 64 93 130
}
