package main

import (
	"fmt"
	"time"
)

func main() {
	d := 90*time.Minute + 30*time.Second
	fmt.Println(d, d.Hours(), d.Round(time.Hour))

	t := time.Date(2024, time.February, 28, 22, 30, 0, 0, time.UTC)
	fmt.Println(t.Format("2006-01-02 15:04:05"))
	fmt.Println(t.Add(48 * time.Hour).Format(time.RFC1123))
	fmt.Println(t.Weekday(), t.YearDay())

	p, err := time.Parse("2006-01-02", "2024-03-15")
	if err != nil {
		panic(err)
	}
	fmt.Println(p.Sub(t).Truncate(time.Hour))
}
