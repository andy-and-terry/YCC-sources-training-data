package main

import (
	"fmt"
	"math/cmplx"
)

func main() {
	for y := -1.0; y <= 1.0; y += 0.2 {
		line := ""
		for x := -2.0; x <= 0.6; x += 0.05 {
			z, c := complex(0, 0), complex(x, y)
			n := 0
			for n < 30 && cmplx.Abs(z) < 2 {
				z = z*z + c
				n++
			}
			if n == 30 {
				line += "#"
			} else {
				line += "."
			}
		}
		fmt.Println(line)
	}
}
