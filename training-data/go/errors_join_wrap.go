package main

import (
	"errors"
	"fmt"
)

var ErrNotFound = errors.New("not found")

func main() {
	e1 := fmt.Errorf("load config: %w", ErrNotFound)
	e2 := errors.New("disk full")
	joined := errors.Join(e1, e2)
	fmt.Println(joined)
	fmt.Println(errors.Is(joined, ErrNotFound))
}
