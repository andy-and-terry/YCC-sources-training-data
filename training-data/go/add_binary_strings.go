package main

import "fmt"

func addBinary(a, b string) string {
	i, j, carry := len(a)-1, len(b)-1, 0
	var out []byte
	for i >= 0 || j >= 0 || carry > 0 {
		sum := carry
		if i >= 0 {
			sum += int(a[i] - '0')
			i--
		}
		if j >= 0 {
			sum += int(b[j] - '0')
			j--
		}
		out = append(out, byte('0'+sum%2))
		carry = sum / 2
	}
	for l, r := 0, len(out)-1; l < r; l, r = l+1, r-1 {
		out[l], out[r] = out[r], out[l]
	}
	return string(out)
}

func main() {
	fmt.Println(addBinary("1010", "1011")) // 10101
}
