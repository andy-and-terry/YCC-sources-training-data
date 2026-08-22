package main

import "fmt"

func safeDivide(a, b int) (result int, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("recovered from panic: %v", r)
		}
	}()
	result = a / b
	return result, nil
}

func main() {
	result, err := safeDivide(10, 2)
	fmt.Println(result, err)

	result, err = safeDivide(10, 0)
	fmt.Println(result, err)
}
