package main

import "fmt"

// egyptian returns denominators d such that num/den = sum(1/d).
func egyptian(num, den int) []int {
	var out []int
	for num != 0 {
		d := (den + num - 1) / num
		out = append(out, d)
		num = num*d - den
		den *= d
	}
	return out
}

func main() {
	fmt.Println(egyptian(4, 13)) // [4 18 468]
}
