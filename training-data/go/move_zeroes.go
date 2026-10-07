package main

import "fmt"

// moveToEnd moves elements equal to v to the end, keeping the order of the rest.
func moveToEnd[T comparable](a []T, v T) {
	w := 0
	for _, x := range a {
		if x != v {
			a[w] = x
			w++
		}
	}
	for ; w < len(a); w++ {
		a[w] = v
	}
}

func main() {
	nums := []int{0, 1, 0, 3, 12, 0, 7}
	moveToEnd(nums, 0)
	fmt.Println(nums)
	words := []string{"", "a", "", "b", "c"}
	moveToEnd(words, "")
	fmt.Printf("%q\n", words)
}
