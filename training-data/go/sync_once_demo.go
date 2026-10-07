package main

import (
	"fmt"
	"sync"
)

type Config struct{ Name string }

var (
	once     sync.Once
	instance *Config
)

func GetConfig() *Config {
	once.Do(func() {
		fmt.Println("initializing")
		instance = &Config{Name: "prod"}
	})
	return instance
}

func main() {
	var wg sync.WaitGroup
	for i := 0; i < 3; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			_ = GetConfig()
		}()
	}
	wg.Wait()
	fmt.Println(GetConfig().Name)
}
