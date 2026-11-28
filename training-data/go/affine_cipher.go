package main

import "fmt"

func modInverse(a, m int) int {
	for x := 1; x < m; x++ {
		if a*x%m == 1 {
			return x
		}
	}
	return 0
}

func affine(text string, a, b int, decrypt bool) string {
	inv := modInverse(a, 26)
	out := []rune{}
	for _, r := range text {
		if r >= 'A' && r <= 'Z' {
			x := int(r - 'A')
			var y int
			if decrypt {
				y = ((inv*(x-b))%26 + 26) % 26
			} else {
				y = (a*x + b) % 26
			}
			r = rune(y) + 'A'
		}
		out = append(out, r)
	}
	return string(out)
}

func main() {
	c := affine("AFFINE", 5, 8, false)
	fmt.Println(c, affine(c, 5, 8, true))
}
