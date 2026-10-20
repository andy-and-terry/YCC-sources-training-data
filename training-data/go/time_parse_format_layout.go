package main

import (
	"fmt"
	"time"
)

func main() {
	t, err := time.Parse("2006-01-02 15:04", "2024-03-09 18:30")
	if err != nil {
		panic(err)
	}
	fmt.Println(t.Format(time.RFC3339), t.Weekday(), t.YearDay())
	fmt.Println(t.Add(36*time.Hour).Format("Mon Jan 2 3:04PM"))
	d := time.Date(2024, 3, 9, 0, 0, 0, 0, time.UTC).Sub(time.Date(2024, 1, 1, 0, 0, 0, 0, time.UTC))
	fmt.Println(d, d.Hours()/24)
	fmt.Println(t.Truncate(time.Hour).Format("15:04"), t.AddDate(0, 1, 0).Month())
	_, err = time.Parse("2006-01-02", "2024-13-01")
	fmt.Println(err != nil)
	dur, _ := time.ParseDuration("1h15m30s")
	fmt.Println(dur.Minutes())
}
