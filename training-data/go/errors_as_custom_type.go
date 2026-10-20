package main

import (
	"errors"
	"fmt"
	"io/fs"
	"os"
)

type NotFound struct{ ID int }

func (e *NotFound) Error() string { return fmt.Sprintf("id %d not found", e.ID) }

func find(id int) error {
	return fmt.Errorf("lookup: %w", &NotFound{ID: id})
}

func main() {
	err := find(7)
	var nf *NotFound
	if errors.As(err, &nf) {
		fmt.Println("as:", nf.ID)
	}
	_, err = os.Open("/no/such/file")
	fmt.Println(errors.Is(err, fs.ErrNotExist))
	var pe *fs.PathError
	fmt.Println(errors.As(err, &pe), pe.Op)
	fmt.Println(errors.Unwrap(find(1)) != nil)
}
