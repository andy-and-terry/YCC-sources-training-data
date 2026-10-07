package main

import "fmt"

func fibonacciSearch(a []int, target int) int {
	n := len(a)
	f2, f1, f := 0, 1, 1
	for f < n {
		f2, f1 = f1, f
		f = f1 + f2
	}
	offset := -1
	for f > 1 {
		i := min(offset+f2, n-1)
		switch {
		case a[i] < target:
			f, f1 = f1, f2
			f2 = f - f1
			offset = i
		case a[i] > target:
			f, f1 = f2, f1-f2
			f2 = f - f1
		default:
			return i
		}
	}
	if f1 == 1 && offset+1 < n && a[offset+1] == target {
		return offset + 1
	}
	return -1
}

func main() {
	a := []int{10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100}
	for _, t := range []int{85, 10, 100, 7} {
		fmt.Println(t, fibonacciSearch(a, t))
	}
}
