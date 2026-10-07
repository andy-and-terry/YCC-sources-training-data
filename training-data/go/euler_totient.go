package main

import "fmt"

func phi(n uint64) uint64 {
	result := n
	for p := uint64(2); p*p <= n; p++ {
		if n%p != 0 {
			continue
		}
		for n%p == 0 {
			n /= p
		}
		result -= result / p
	}
	if n > 1 {
		result -= result / n
	}
	return result
}

func phiSieve(limit int) []int {
	t := make([]int, limit+1)
	for i := range t {
		t[i] = i
	}
	for i := 2; i <= limit; i++ {
		if t[i] == i {
			for j := i; j <= limit; j += i {
				t[j] -= t[j] / i
			}
		}
	}
	return t
}

func main() {
	t := phiSieve(1_000_000)
	fmt.Println(t[1:21])
	sum := 0
	for _, v := range t[2:] {
		sum += v
	}
	fmt.Println("sum phi(2..1e6) =", sum, "phi(10^12) =", phi(1_000_000_000_000))
}
