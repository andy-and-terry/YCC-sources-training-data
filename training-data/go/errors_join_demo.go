package main

import (
	"errors"
	"fmt"
)

var (
	ErrEmptyName = errors.New("name is empty")
	ErrBadAge    = errors.New("age out of range")
)

func validate(name string, age int) error {
	var errs []error
	if name == "" {
		errs = append(errs, ErrEmptyName)
	}
	if age < 0 || age > 150 {
		errs = append(errs, fmt.Errorf("age %d: %w", age, ErrBadAge))
	}
	return errors.Join(errs...)
}

func main() {
	err := validate("", 200)
	fmt.Println(err)
	fmt.Println(errors.Is(err, ErrEmptyName), errors.Is(err, ErrBadAge))
	fmt.Println(validate("Bob", 20) == nil)
}
