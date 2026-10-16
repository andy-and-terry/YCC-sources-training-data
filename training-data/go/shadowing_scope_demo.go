package main

import (
	"errors"
	"fmt"
)

var x = "package"

func mayFail() (int, error) { return 0, errors.New("boom") }

func buggy() error {
	var err error
	if true {
		_, err := mayFail() // shadows outer err
		_ = err
	}
	return err
}

func correct() error {
	var err error
	if true {
		_, err = mayFail()
	}
	return err
}

func main() {
	fmt.Println(x)
	x := "function"
	{
		x := "block"
		fmt.Println(x)
	}
	fmt.Println(x)

	if x := len(x); x > 3 {
		fmt.Println("len", x)
	}
	fmt.Println("buggy:", buggy())
	fmt.Println("correct:", correct())
}
