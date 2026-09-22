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
		fmt.Println("initializing config...")
		instance = &config{value: "loaded"}
	})
	return instance
}

func main() {
	var wg sync.WaitGroup
	for i := 0; i < 5; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			_ = getConfig()
		}()
	}
	wg.Wait()
	fmt.Println(getConfig().value)
}
