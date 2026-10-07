package main

import "fmt"

func isLeapYear(year int) bool {
	return year%4 == 0 && (year%100 != 0 || year%400 == 0)
}

func main() {
	for _, year := range []int{2000, 1900, 2024, 2023} {
		fmt.Printf("%d is leap year: %v\n", year, isLeapYear(year))
	}
}
