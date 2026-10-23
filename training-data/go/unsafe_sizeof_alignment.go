package main

import (
	"fmt"
	"unsafe"
)

// Field order affects struct padding. Grouping larger fields first
// usually produces a smaller struct.
type Wasteful struct {
	A bool
	B int64
	C bool
	D int32
}

type Compact struct {
	B int64
	D int32
	A bool
	C bool
}

func main() {
	var w Wasteful
	var c Compact

	fmt.Println("Wasteful size:", unsafe.Sizeof(w))
	fmt.Println("Compact size: ", unsafe.Sizeof(c))
	fmt.Println("Wasteful align:", unsafe.Alignof(w))

	fmt.Println("offset of B in Wasteful:", unsafe.Offsetof(w.B))
	fmt.Println("offset of D in Wasteful:", unsafe.Offsetof(w.D))
	fmt.Println("offset of D in Compact: ", unsafe.Offsetof(c.D))

	fmt.Println("string header:", unsafe.Sizeof(""), "slice header:", unsafe.Sizeof([]int{}))
}
