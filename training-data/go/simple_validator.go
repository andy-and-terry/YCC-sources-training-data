package main

import (
	"fmt"
	"regexp"
)

type rule func(string) bool

func required(value string) bool {
	return value != ""
}

var emailRegex = regexp.MustCompile(`^[^@\s]+@[^@\s]+\.[^@\s]+$`)

func isEmail(value string) bool {
	return emailRegex.MatchString(value)
}

func minLength(n int) rule {
	return func(value string) bool {
		return len(value) >= n
	}
}

func validate(data map[string]string, schema map[string][]rule) map[string][]string {
	errors := make(map[string][]string)
	for field, rules := range schema {
		for _, r := range rules {
			if !r(data[field]) {
				errors[field] = append(errors[field], "invalid")
			}
		}
	}
	return errors
}

func main() {
	data := map[string]string{"email": "not-an-email", "password": "short"}
	schema := map[string][]rule{
		"email":    {required, isEmail},
		"password": {required, minLength(8)},
	}
	fmt.Println(validate(data, schema))
}
