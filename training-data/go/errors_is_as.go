package main

import (
	"errors"
	"fmt"
)

type NotFound struct{ Key string }

func (e *NotFound) Error() string { return "not found: " + e.Key }

func main() {
	err := fmt.Errorf("lookup: %w", &NotFound{"k1"})
	var nf *NotFound
	if errors.As(err, &nf) {
		fmt.Println("key", nf.Key)
	}
}
