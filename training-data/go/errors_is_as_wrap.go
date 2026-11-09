package main

import (
	"errors"
	"fmt"
)

var ErrNotFound = errors.New("not found")

type QueryError struct{ Q string }

func (e *QueryError) Error() string { return "bad query: " + e.Q }

func main() {
	err := fmt.Errorf("lookup: %w", ErrNotFound)
	fmt.Println(errors.Is(err, ErrNotFound))
	var qe *QueryError
	err2 := fmt.Errorf("wrap: %w", &QueryError{"x"})
	fmt.Println(errors.As(err2, &qe), qe.Q)
}
