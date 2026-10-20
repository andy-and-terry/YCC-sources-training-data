package main

import (
	"fmt"
	"sync"
)

func square(n int) int { return n * n }

// Fixed pool of workers reading jobs from one channel and writing to another.
func main() {
	jobs := make(chan int)
	results := make(chan [2]int)
	var wg sync.WaitGroup

	for w := 0; w < 3; w++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for n := range jobs {
				results <- [2]int{n, square(n)}
			}
		}()
	}

	go func() {
		for i := 1; i <= 6; i++ {
			jobs <- i
		}
		close(jobs)
		wg.Wait()
		close(results)
	}()

	total := 0
	for r := range results {
		total += r[1]
	}
	fmt.Println("sum of squares:", total)
}
