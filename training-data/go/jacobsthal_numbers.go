// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
package main

import "fmt"

func main() {
	a, b := 0, 1
	for i := 0; i < 15; i++ {
		fmt.Print(a, " ")
		a, b = b, b+2*a
	}
	fmt.Println()
}
