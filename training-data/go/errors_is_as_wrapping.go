package main

import (
	"errors"
	"fmt"
)

var ErrNotFound = errors.New("not found")

type ValidationError struct{ Field string }

func (e *ValidationError) Error() string { return "invalid field " + e.Field }

func lookup(key string) error {
	if key == "" {
		return fmt.Errorf("lookup: %w", &ValidationError{Field: "key"})
	}
	return fmt.Errorf("lookup %q: %w", key, ErrNotFound)
}

func main() {
	err := lookup("abc")
	fmt.Println(errors.Is(err, ErrNotFound), err)

	err = lookup("")
	var ve *ValidationError
	if errors.As(err, &ve) {
		fmt.Println("validation problem on", ve.Field)
	}
}
