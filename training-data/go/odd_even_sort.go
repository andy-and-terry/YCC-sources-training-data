package main

import (
	"fmt"
	"sync"
)

// oddEvenSort runs each phase's independent compare-swaps concurrently.
func oddEvenSort(a []int) {
	for sorted := false; !sorted; {
		sorted = true
		for _, start := range []int{1, 0} {
			var wg sync.WaitGroup
			var mu sync.Mutex
			for i := start; i+1 < len(a); i += 2 {
				wg.Add(1)
				go func(i int) {
					defer wg.Done()
					if a[i] > a[i+1] {
						a[i], a[i+1] = a[i+1], a[i]
						mu.Lock()
						sorted = false
						mu.Unlock()
					}
				}(i)
			}
			wg.Wait()
		}
	}
}

func main() {
	a := []int{34, 2, 10, -9, 5, 3, 1, 99, -4, 0}
	oddEvenSort(a)
	fmt.Println(a)
}
