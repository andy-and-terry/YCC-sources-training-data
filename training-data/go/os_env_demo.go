package main

import (
	"fmt"
	"os"
	"strings"
)

func getenvDefault(key, def string) string {
	if v, ok := os.LookupEnv(key); ok {
		return v
	}
	return def
}

func main() {
	os.Setenv("APP_MODE", "debug")
	fmt.Println(getenvDefault("APP_MODE", "prod"))
	fmt.Println(getenvDefault("APP_MISSING_X", "fallback"))

	os.Setenv("GREETING", "hi")
	fmt.Println(os.Expand("${GREETING}, $APP_MODE user", os.Getenv))
	fmt.Println(os.ExpandEnv("mode=$APP_MODE"))

	os.Unsetenv("APP_MODE")
	_, ok := os.LookupEnv("APP_MODE")
	fmt.Println("still set:", ok)

	count := 0
	for _, kv := range os.Environ() {
		if strings.Contains(kv, "=") {
			count++
		}
	}
	fmt.Println("env entries > 0:", count > 0)
}
