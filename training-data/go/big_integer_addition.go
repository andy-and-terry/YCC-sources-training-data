package main

import (
	"fmt"
	"math/big"
	"strings"
)

// addDecimal adds two non-negative decimal strings digit by digit.
func addDecimal(a, b string) string {
	var out []byte
	i, j, carry := len(a)-1, len(b)-1, 0
	for i >= 0 || j >= 0 || carry > 0 {
		s := carry
		if i >= 0 {
			s += int(a[i] - '0')
			i--
		}
		if j >= 0 {
			s += int(b[j] - '0')
			j--
		}
		out = append(out, byte('0'+s%10))
		carry = s / 10
	}
	for l, r := 0, len(out)-1; l < r; l, r = l+1, r-1 {
		out[l], out[r] = out[r], out[l]
	}
	return string(out)
}

func main() {
	a, b := "99999999999999999999", "1"
	fmt.Println(addDecimal(a, b))
	x, _ := new(big.Int).SetString(strings.Repeat("9", 40), 10)
	y, _ := new(big.Int).SetString("123456789", 10)
	fmt.Println(addDecimal(x.String(), y.String()) == new(big.Int).Add(x, y).String())
	fmt.Println("100! =", new(big.Int).MulRange(1, 100))
}
