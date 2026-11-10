package main

import "fmt"

func pieces(cuts int) int { return (cuts*cuts + cuts + 2) / 2 }

func main() {
	for n := 0; n < 10; n++ {
		fmt.Print(pieces(n), " ")
	}
	fmt.Println() // 1 2 4 7 11 16 22 29 37 46
}
