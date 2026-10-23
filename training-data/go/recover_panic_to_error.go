package main

import (
	"errors"
	"fmt"
)

func safeDivide(a, b int) (res int, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("recovered: %v", r)
		}
	}()
	return a / b, nil
}

func main() {
	fmt.Println(safeDivide(10, 2))
	_, err := safeDivide(1, 0)
	fmt.Println(err, errors.Unwrap(err) == nil)
}
