package main

import "fmt"

type Color int

const (
	Red Color = iota
	Green
	Blue
)

func (c Color) String() string { return [...]string{"Red", "Green", "Blue"}[c] }

func main() { fmt.Println(Green, Blue) }
