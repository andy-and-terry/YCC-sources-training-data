package main

import "fmt"

func columnTitle(n int) string {
	var out []byte
	for n > 0 {
		n--
		out = append([]byte{byte('A' + n%26)}, out...)
		n /= 26
	}
	return string(out)
}

func main() {
	fmt.Println(columnTitle(28), columnTitle(701)) // AB ZY
}
