package main

import (
	"fmt"
	"runtime"
)

func safeDivide(a, b int) (res int, err error) {
	defer func() {
		if r := recover(); r != nil {
			if re, ok := r.(runtime.Error); ok {
				err = fmt.Errorf("runtime error recovered: %w", re)
				return
			}
			panic(r)
		}
	}()
	return a / b, nil
}

func indexOr(s []int, i int) (v int, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("recovered: %v", r)
		}
	}()
	return s[i], nil
}

func main() {
	fmt.Println(safeDivide(10, 2))
	fmt.Println(safeDivide(1, 0))
	fmt.Println(indexOr([]int{1, 2}, 5))
}
