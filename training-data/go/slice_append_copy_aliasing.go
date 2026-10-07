package main

import "fmt"

func main() {
	a := []int{1, 2, 3, 4, 5}
	b := a[1:3]
	fmt.Println(b, len(b), cap(b))
	b = append(b, 99) // overwrites a[3] because capacity is shared
	fmt.Println(a, b)

	c := make([]int, len(a))
	n := copy(c, a)
	c[0] = -1
	fmt.Println(n, a, c)

	d := a[1:3:3] // full slice expression limits capacity
	d = append(d, 7)
	fmt.Println(a, d)

	// delete element at index 2 preserving order
	a = append(a[:2], a[3:]...)
	fmt.Println(a)
}
