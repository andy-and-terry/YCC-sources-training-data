package main

import "fmt"

// Countup returns a Go 1.23+ range-over-func iterator (iter.Seq[int]) that
// yields integers from start to end inclusive. Range-over-func lets custom
// data sources be walked with a plain `for ... range` loop.
func Countup(start, end int) func(yield func(int) bool) {
	return func(yield func(int) bool) {
		for i := start; i <= end; i++ {
			if !yield(i) {
				return
			}
		}
	}
}

// Pairs returns a two-value iterator (iter.Seq2[int, int]) yielding each
// element's index alongside its squared value.
func Pairs(nums []int) func(yield func(int, int) bool) {
	return func(yield func(int, int) bool) {
		for i, n := range nums {
			if !yield(i, n*n) {
				return
			}
		}
	}
}

func main() {
	sum := 0
	for n := range Countup(1, 5) {
		sum += n
	}
	fmt.Println("sum:", sum)

	// Range-over-func supports early termination via break, same as a slice.
	for n := range Countup(1, 100) {
		if n > 3 {
			break
		}
		fmt.Println("countup:", n)
	}

	for i, sq := range Pairs([]int{2, 3, 4}) {
		fmt.Printf("index=%d square=%d\n", i, sq)
	}
}
