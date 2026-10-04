package main

import (
	"fmt"
	"sync"
)

type Config struct {
	Name string
}

var (
	once     sync.Once
	instance *Config
	initRuns int
)

func GetConfig() *Config {
	once.Do(func() {
		initRuns++
		instance = &Config{Name: "production"}
	})
	return instance
}

func main() {
	var wg sync.WaitGroup
	results := make([]*Config, 10)

	for i := range results {
		wg.Add(1)
		go func(i int) {
			defer wg.Done()
			results[i] = GetConfig()
		}(i)
	}
	wg.Wait()

	same := true
	for _, c := range results {
		if c != results[0] {
			same = false
		}
	}
	fmt.Println("all same pointer:", same)
	fmt.Println("init ran:", initRuns, "time(s)")
}
