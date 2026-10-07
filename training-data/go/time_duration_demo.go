package main

import (
	"fmt"
	"time"
)

func main() {
	d := 90*time.Minute + 30*time.Second
	fmt.Println(d, d.Hours(), d.Round(time.Hour))

	parsed, _ := time.ParseDuration("1h15m30.5s")
	fmt.Println(parsed.Seconds())

	t := time.Date(2024, time.February, 28, 23, 0, 0, 0, time.UTC)
	next := t.Add(2 * time.Hour)
	fmt.Println(next.Format("2006-01-02 15:04:05"), next.Weekday())
	fmt.Println(next.Sub(t), next.After(t))
	fmt.Println(t.AddDate(0, 1, 1).Format(time.RFC3339))
}
