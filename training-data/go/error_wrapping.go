package main

import (
	"errors"
	"fmt"
)

var ErrNotFound = errors.New("not found")

type ValidationError struct {
	Field string
}

func (e *ValidationError) Error() string {
	return fmt.Sprintf("validation failed for field %q", e.Field)
}

func findUser(id int) error {
	if id < 0 {
		return &ValidationError{Field: "id"}
	}
	if id > 100 {
		return fmt.Errorf("lookup user %d: %w", id, ErrNotFound)
	}
	return nil
}

func main() {
	err := findUser(999)
	fmt.Println(err)
	fmt.Println(errors.Is(err, ErrNotFound))

	err2 := findUser(-1)
	var valErr *ValidationError
	if errors.As(err2, &valErr) {
		fmt.Println("validation error on field:", valErr.Field)
	}
}
