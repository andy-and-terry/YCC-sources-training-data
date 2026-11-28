package main

import "fmt"

func isArmstrong(n int) bool {
	digits := []int{}
	for m := n; m > 0; m /= 10 {
		digits = append(digits, m%10)
	}
	sum := 0
	for _, d := range digits {
		p := 1
		for i := 0; i < len(digits); i++ {
			p *= d
		}
		sum += p
	}
	return sum == n
}

func main() {
	for n := 1; n < 1000; n++ {
		if isArmstrong(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println() // 1 2 3 4 5 6 7 8 9 153 370 371 407
}
