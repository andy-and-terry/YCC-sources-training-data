package main

import (
	"fmt"
	"strconv"
)

// Moser-de Bruijn sequence: binary digits of n read in base 4.
func main() {
	for n := 0; n < 12; n++ {
		v, _ := strconv.ParseInt(strconv.FormatInt(int64(n), 2), 4, 64)
		fmt.Print(v, " ")
	}
	fmt.Println()
}
