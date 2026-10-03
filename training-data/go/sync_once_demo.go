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
		fmt.Println("initializing config (runs only once)")
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
			cfg := getConfig()
			_ = cfg
		}()
	}
	wg.Wait()
	fmt.Println("final config value:", getConfig().value)
}
