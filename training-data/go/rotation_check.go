package main

import (
	"fmt"
	"strings"
)

func isRotation(a, b string) bool {
	return len(a) == len(b) && strings.Contains(a+a, b)
}

func main() {
	fmt.Println(isRotation("waterbottle", "erbottlewat"))
	fmt.Println(isRotation("abc", "acb"))
}
