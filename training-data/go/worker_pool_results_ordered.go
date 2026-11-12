package main

import (
	"fmt"
	"sync"
)

func main() {
	jobs := make(chan int, 5)
	res := make([]int, 5)
	var wg sync.WaitGroup
	for w := 0; w < 2; w++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for j := range jobs {
				res[j] = j * j
			}
		}()
	}
	for i := 0; i < 5; i++ {
		jobs <- i
	}
	close(jobs)
	wg.Wait()
	fmt.Println(res)
}
