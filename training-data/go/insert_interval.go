package main

import "fmt"

func insertInterval(iv [][2]int, n [2]int) [][2]int {
	var out [][2]int
	i := 0
	for i < len(iv) && iv[i][1] < n[0] {
		out = append(out, iv[i])
		i++
	}
	for i < len(iv) && iv[i][0] <= n[1] {
		n = [2]int{min(n[0], iv[i][0]), max(n[1], iv[i][1])}
		i++
	}
	out = append(out, n)
	return append(out, iv[i:]...)
}

func main() {
	fmt.Println(insertInterval([][2]int{{1, 3}, {6, 9}}, [2]int{2, 5})) // [[1 5] [6 9]]
}
