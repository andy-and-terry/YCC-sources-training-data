package main

import "fmt"

func stern(count int) []int {
	s := make([]int, count+2)
	s[1] = 1
	for i := 2; i < count; i++ {
		if i%2 == 0 {
			s[i] = s[i/2]
		} else {
			s[i] = s[i/2] + s[i/2+1]
		}
	}
	return s[:count]
}

func main() {
	for _, v := range stern(20) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
