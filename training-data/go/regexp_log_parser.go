package main

import (
	"fmt"
	"regexp"
)

func main() {
	logLine := `2024-03-15 14:22:01 [ERROR] user=42 msg="connection refused"`

	pattern := regexp.MustCompile(`^(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2}) \[(\w+)\] user=(\d+) msg="([^"]*)"$`)
	match := pattern.FindStringSubmatch(logLine)
	if match == nil {
		fmt.Println("no match")
		return
	}

	names := pattern.SubexpNames()
	for i, value := range match {
		if i == 0 {
			continue
		}
		label := fmt.Sprintf("field%d", i)
		if names[i] != "" {
			label = names[i]
		}
		fmt.Printf("%s: %s\n", label, value)
	}

	emails := "alice@example.com, bob@test.org, not-an-email"
	emailPattern := regexp.MustCompile(`[\w.]+@[\w.]+\.\w+`)
	fmt.Println(emailPattern.FindAllString(emails, -1))

	redacted := emailPattern.ReplaceAllString(emails, "[redacted]")
	fmt.Println(redacted)
}
