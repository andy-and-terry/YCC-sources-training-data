package main

import (
	"fmt"
	"sync"
)

var (
	once   sync.Once
	config map[string]string
)

func getConfig() map[string]string {
	once.Do(func() {
		fmt.Println("initializing config")
		config = map[string]string{"mode": "prod"}
	})
	return config
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
	fmt.Println(getConfig()["mode"])
}
