package main

import (
	"fmt"
	"sync"
)

type result struct {
	idx, val int
}

func main() {
	jobs := make(chan int)
	res := make(chan result)
	var wg sync.WaitGroup
	for w := 0; w < 3; w++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for j := range jobs {
				res <- result{j, j * 10}
			}
		}()
	}
	go func() {
		for i := 0; i < 6; i++ {
			jobs <- i
		}
		close(jobs)
		wg.Wait()
		close(res)
	}()
	out := make([]int, 6)
	for r := range res {
		out[r.idx] = r.val
	}
	fmt.Println(out)
}
