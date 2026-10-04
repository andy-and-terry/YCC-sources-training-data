package main

import (
	"fmt"
	"time"
)

func main() {
	d := 90*time.Minute + 30*time.Second
	fmt.Println("duration:", d)
	fmt.Printf("hours=%.2f minutes=%.1f seconds=%d\n", d.Hours(), d.Minutes(), int(d.Seconds()))

	parsed, err := time.ParseDuration("1h15m30.5s")
	if err != nil {
		fmt.Println("parse error:", err)
		return
	}
	fmt.Println("parsed:", parsed, "rounded:", parsed.Round(time.Minute), "truncated:", parsed.Truncate(time.Hour))

	start := time.Date(2024, time.February, 28, 22, 0, 0, 0, time.UTC)
	end := start.Add(5 * time.Hour)
	fmt.Println("start:", start.Format(time.RFC3339))
	fmt.Println("end:  ", end.Format("2006-01-02 15:04"))
	fmt.Println("elapsed:", end.Sub(start))
	fmt.Println("weekday, day of year:", end.Weekday(), end.YearDay())
}
