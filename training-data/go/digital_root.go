package main

import "fmt"

func digitSum(n uint64) uint64 {
	var s uint64
	for ; n > 0; n /= 10 {
		s += n % 10
	}
	return s
}

func digitalRootIter(n uint64) uint64 {
	for n >= 10 {
		n = digitSum(n)
	}
	return n
}

func digitalRoot(n uint64) uint64 {
	if n == 0 {
		return 0
	}
	return 1 + (n-1)%9
}

func main() {
	for _, n := range []uint64{0, 16, 942, 132189, 493193, 18446744073709551615} {
		fmt.Println(n, digitalRoot(n), digitalRoot(n) == digitalRootIter(n))
	}
}
