package main

import (
	"fmt"
	"sync"
)

func square(n int) int { return n * n }

func main() {
	nums := []int{1, 2, 3, 4, 5}
	results := make([]int, len(nums))
	var wg sync.WaitGroup
	for i, n := range nums {
		wg.Add(1)
		go func() {
			defer wg.Done()
			results[i] = square(n)
		}()
	}
	wg.Wait()
	fmt.Println(results)
}
