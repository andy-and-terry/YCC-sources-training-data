package main

import (
	"errors"
	"fmt"
)

var ErrNotFound = errors.New("not found")

type QueryError struct{ Query string }

func (e *QueryError) Error() string { return "bad query: " + e.Query }

func find(q string) error {
	if q == "" {
		return &QueryError{q}
	}
	return fmt.Errorf("find %q: %w", q, ErrNotFound)
}

func main() {
	err := find("x")
	fmt.Println(errors.Is(err, ErrNotFound))
	var qe *QueryError
	fmt.Println(errors.As(find(""), &qe), qe.Query == "")
}
