package main

import "fmt"

func modifyArray(a [3]int)  { a[0] = 100 }
func modifySlice(s []int)   { s[0] = 100 }
func appendSlice(s []int)   { s = append(s, 4) }

func main() {
	arr := [3]int{1, 2, 3}
	modifyArray(arr)
	fmt.Println("array after call:", arr)

	b := arr // full copy
	b[1] = 50
	fmt.Println(arr, b)

	sl := []int{1, 2, 3}
	modifySlice(sl)
	fmt.Println("slice after call:", sl)

	appendSlice(sl)
	fmt.Println("after append in callee:", sl, len(sl), cap(sl))

	fmt.Println(arr == [3]int{100, 2, 3}, arr == [3]int{1, 2, 3})
}
