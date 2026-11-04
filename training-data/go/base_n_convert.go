package main

import (
	"fmt"
	"strconv"
)

func main() {
	for _, base := range []int{2, 8, 16, 36} {
		fmt.Printf("255 in base %d = %s\n", base, strconv.FormatInt(255, base))
	}
	n, err := strconv.ParseInt("zz", 36, 64)
	fmt.Println(n, err)
	_, err = strconv.ParseInt("9", 8, 64)
	fmt.Println(err)
}
