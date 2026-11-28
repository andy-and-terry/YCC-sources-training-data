package main

import (
	"fmt"
	"time"
)

func main() {
	d, err := time.ParseDuration("1h15m30s")
	fmt.Println(d, err, d.Minutes())
	t := time.Date(2024, 2, 28, 12, 0, 0, 0, time.UTC)
	fmt.Println(t.Add(48 * time.Hour).Format("2006-01-02 Mon"))
}
