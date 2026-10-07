package main

import "fmt"

func combSort(a []int) {
	gap := len(a)
	for sorted := false; !sorted; {
		gap = int(float64(gap) / 1.3)
		if gap <= 1 {
			gap = 1
			sorted = true
		}
		for i := 0; i+gap < len(a); i++ {
			if a[i] > a[i+gap] {
				a[i], a[i+gap] = a[i+gap], a[i]
				sorted = false
			}
		}
	}
}

func main() {
	a := []int{8, 4, 1, 56, 3, -44, 23, -6, 28, 0}
	combSort(a)
	fmt.Println(a)
}
