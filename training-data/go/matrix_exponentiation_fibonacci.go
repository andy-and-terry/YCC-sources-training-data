package main

import "fmt"

type mat2x2 [2][2]int64

func matMul(a, b mat2x2) mat2x2 {
	var c mat2x2
	for i := 0; i < 2; i++ {
		for j := 0; j < 2; j++ {
			for k := 0; k < 2; k++ {
				c[i][j] += a[i][k] * b[k][j]
			}
		}
	}
	return c
}

func matPow(m mat2x2, n int) mat2x2 {
	result := mat2x2{{1, 0}, {0, 1}}
	for n > 0 {
		if n&1 == 1 {
			result = matMul(result, m)
		}
		m = matMul(m, m)
		n >>= 1
	}
	return result
}

func fibonacci(n int) int64 {
	if n == 0 {
		return 0
	}
	base := mat2x2{{1, 1}, {1, 0}}
	result := matPow(base, n-1)
	return result[0][0]
}

func main() {
	for i := 0; i <= 10; i++ {
		fmt.Printf("fib(%d) = %d\n", i, fibonacci(i))
	}
}
