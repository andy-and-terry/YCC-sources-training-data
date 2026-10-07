package main

import (
	"fmt"
	"strconv"
)

func main() {
	n, err := strconv.Atoi("123")
	fmt.Println(n, err)

	_, err = strconv.Atoi("12x")
	fmt.Println(err)

	hex, _ := strconv.ParseInt("ff", 16, 64)
	fmt.Println(hex, strconv.FormatInt(255, 2))

	f, _ := strconv.ParseFloat("3.14159", 64)
	fmt.Println(strconv.FormatFloat(f, 'f', 2, 64))

	b, _ := strconv.ParseBool("true")
	fmt.Println(b, strconv.Quote("hi\n\"there\""))
}
