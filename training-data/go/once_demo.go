package main

import (
	"fmt"
	"sync"
)

func main() {
	var once sync.Once
	var wg sync.WaitGroup
	for i := 0; i < 5; i++ {
		wg.Add(1)
		go func(id int) {
			defer wg.Done()
			once.Do(func() { fmt.Println("initialized exactly once") })
		}(i)
	}
	wg.Wait()

	lazy := sync.OnceValue(func() int {
		fmt.Println("computing")
		return 42
	})
	fmt.Println(lazy(), lazy())
}
