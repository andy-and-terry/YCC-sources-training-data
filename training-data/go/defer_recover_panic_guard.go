package main

import "fmt"

func safe(f func()) (err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("recovered: %v", r)
		}
	}()
	f()
	return nil
}

func main() {
	fmt.Println(safe(func() { var a []int; _ = a[3] }))
	fmt.Println(safe(func() {}))
}
