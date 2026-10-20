package main

import (
	"bytes"
	"encoding/gob"
	"fmt"
)

type Point struct {
	X, Y int
	Tags []string
}

func main() {
	var buf bytes.Buffer
	if err := gob.NewEncoder(&buf).Encode(Point{1, 2, []string{"a", "b"}}); err != nil {
		panic(err)
	}
	var out Point
	if err := gob.NewDecoder(&buf).Decode(&out); err != nil {
		panic(err)
	}
	fmt.Printf("%+v\n", out)
}
