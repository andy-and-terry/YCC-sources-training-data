package main

import (
	"fmt"
	"sync"
)

type config struct {
	value string
}

var (
	instance *config
	once     sync.Once
)

func getConfig() *config {
	once.Do(func() {
		fmt.Println("initializing config (should print once)")
		instance = &config{value: "loaded"}
	})
	return instance
}

func main() {
	var wg sync.WaitGroup
	results := make([]*config, 10)

	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(n int) {
			defer wg.Done()
			results[n] = getConfig()
		}(i)
	}
	wg.Wait()

	for _, r := range results {
		if r != instance {
			fmt.Println("mismatch found")
			return
		}
	}
	fmt.Println("all goroutines got the same config instance:", instance.value)
}
