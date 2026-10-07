package main

import (
	"fmt"
	"math"
	"math/cmplx"
)

func fft(a []complex128) []complex128 {
	n := len(a)
	if n == 1 {
		return []complex128{a[0]}
	}
	even, odd := make([]complex128, n/2), make([]complex128, n/2)
	for i := 0; i < n/2; i++ {
		even[i], odd[i] = a[2*i], a[2*i+1]
	}
	e, o := fft(even), fft(odd)
	out := make([]complex128, n)
	for k := 0; k < n/2; k++ {
		t := cmplx.Rect(1, -2*math.Pi*float64(k)/float64(n)) * o[k]
		out[k], out[k+n/2] = e[k]+t, e[k]-t
	}
	return out
}

func main() {
	z1, z2 := complex(3, 4), complex(1, -2)
	fmt.Println(z1*z2, z1/z2, cmplx.Abs(z1), cmplx.Exp(complex(0, math.Pi)))
	for i, x := range fft([]complex128{1, 1, 1, 1, 0, 0, 0, 0}) {
		fmt.Printf("X[%d] = %6.3f\n", i, x)
	}
}
