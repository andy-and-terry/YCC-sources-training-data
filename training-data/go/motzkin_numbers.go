package main

import "fmt"

func motzkin(n int) int {
	m := []int{1, 1}
	for i := 2; i <= n; i++ {
		m = append(m, ((2*i+1)*m[i-1]+3*(i-1)*m[i-2])/(i+2))
	}
	return m[n]
}

func main() {
	for i := 0; i < 10; i++ {
		fmt.Print(motzkin(i), " ")
	}
	fmt.Println()
}
