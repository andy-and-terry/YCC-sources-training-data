package main

import "fmt"

func toBT(n int) string {
	if n == 0 {
		return "0"
	}
	var out []byte
	for n != 0 {
		r := ((n % 3) + 3) % 3
		switch r {
		case 0:
			out = append(out, '0')
		case 1:
			out = append(out, '+')
			n--
		default:
			out = append(out, '-')
			n++
		}
		n /= 3
	}
	for i, j := 0, len(out)-1; i < j; i, j = i+1, j-1 {
		out[i], out[j] = out[j], out[i]
	}
	return string(out)
}

func fromBT(s string) int {
	n := 0
	for _, c := range s {
		n *= 3
		switch c {
		case '+':
			n++
		case '-':
			n--
		}
	}
	return n
}

func main() {
	for _, k := range []int{-14, -1, 0, 5, 42} {
		fmt.Println(k, toBT(k), fromBT(toBT(k)) == k)
	}
}
