package main

import (
	"fmt"
	"math/big"
)

func factorial(n int64) *big.Int {
	r := big.NewInt(1)
	for i := int64(2); i <= n; i++ {
		r.Mul(r, big.NewInt(i))
	}
	return r
}

func main() {
	fmt.Println(factorial(30))
	f := factorial(50)
	fmt.Println(len(f.String()), "digits")

	a, _ := new(big.Int).SetString("123456789012345678901234567890", 10)
	b := big.NewInt(987654321)
	q, r := new(big.Int).DivMod(a, b, new(big.Int))
	fmt.Println(q, r)
	fmt.Println(new(big.Int).Exp(big.NewInt(2), big.NewInt(200), nil))
	fmt.Println(big.NewInt(1000000007).ProbablyPrime(10))
}
