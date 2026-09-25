package main

import "fmt"

const mod = 1_000_000_007

type mat [2][2]uint64

func (a mat) mul(b mat) mat {
	var c mat
	for i := 0; i < 2; i++ {
		for k := 0; k < 2; k++ {
			for j := 0; j < 2; j++ {
				c[i][j] = (c[i][j] + a[i][k]*b[k][j]) % mod
			}
		}
	}
	return c
}

func fib(n uint64) uint64 {
	r, m := mat{{1, 0}, {0, 1}}, mat{{1, 1}, {1, 0}}
	for ; n > 0; n >>= 1 {
		if n&1 == 1 {
			r = r.mul(m)
		}
		m = m.mul(m)
	}
	return r[0][1]
}

func main() {
	for i := uint64(0); i < 15; i++ {
		fmt.Print(fib(i), " ")
	}
	fmt.Println("\nfib(1e18) mod p =", fib(1e18))
}
