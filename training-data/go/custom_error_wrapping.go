package main

import (
	"errors"
	"fmt"
)

type NotFound struct{ Key string }

func (e *NotFound) Error() string { return "not found: " + e.Key }

func lookup(k string) error {
	return fmt.Errorf("lookup failed: %w", &NotFound{k})
}

func main() {
	err := lookup("user42")
	var nf *NotFound
	if errors.As(err, &nf) {
		fmt.Println("missing key:", nf.Key)
	}
	fmt.Println(err)
}
