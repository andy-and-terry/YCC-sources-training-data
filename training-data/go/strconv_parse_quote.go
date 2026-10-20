package main

import (
	"fmt"
	"strconv"
)

func main() {
	n, err := strconv.Atoi("12a")
	fmt.Println(n, err)
	i, _ := strconv.ParseInt("-ff", 16, 64)
	u, _ := strconv.ParseUint("777", 8, 32)
	fmt.Println(i, u)
	_, err = strconv.ParseInt("300", 10, 8)
	fmt.Println(err)
	f, _ := strconv.ParseFloat("1e-3", 64)
	b, _ := strconv.ParseBool("T")
	fmt.Println(f, b)
	fmt.Println(strconv.Quote("tab\there \"q\""), strconv.FormatInt(255, 2))
	s, _ := strconv.Unquote(`"a\nb"`)
	fmt.Printf("%q %s\n", s, strconv.FormatFloat(3.14159, 'f', 2, 64))
}
