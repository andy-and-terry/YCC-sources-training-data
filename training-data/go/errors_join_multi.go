package main

import (
	"errors"
	"fmt"
)

func main() {
	e1 := errors.New("disk full")
	e2 := errors.New("permission denied")
	joined := errors.Join(e1, e2)
	fmt.Println(joined)
	fmt.Println(errors.Is(joined, e2))
}
