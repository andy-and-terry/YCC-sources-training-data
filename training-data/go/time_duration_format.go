package main

import (
	"fmt"
	"time"
)

func main() {
	t := time.Date(2024, 3, 15, 13, 4, 5, 0, time.UTC)
	fmt.Println(t.Format("2006-01-02 15:04"), t.Weekday(), t.YearDay())
	d := 90*time.Minute + 30*time.Second
	fmt.Println(d, d.Hours(), t.Add(d).Format(time.RFC3339))
}
