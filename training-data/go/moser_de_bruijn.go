package main

import "fmt"

func moserDeBruijn(i int) int {
	value, power := 0, 1
	for ; i > 0; i >>= 1 {
		if i&1 == 1 {
			value += power
		}
		power *= 4
	}
	return value
}

func main() {
	for i := 0; i < 10; i++ {
		fmt.Print(moserDeBruijn(i), " ")
	}
	fmt.Println() // 0 1 4 5 16 17 20 21 64 65
}
