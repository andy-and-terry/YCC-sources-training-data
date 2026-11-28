package main

import (
	"fmt"
	"sort"
)

func order(n, k int) []int {
	pat := []int{}
	for i := 0; i < k; i++ {
		pat = append(pat, i)
	}
	for i := k - 2; i > 0; i-- {
		pat = append(pat, i)
	}
	idx := make([]int, n)
	for i := range idx {
		idx[i] = i
	}
	sort.SliceStable(idx, func(a, b int) bool { return pat[idx[a]%len(pat)] < pat[idx[b]%len(pat)] })
	return idx
}

func encrypt(t string, k int) string {
	out := []byte{}
	for _, i := range order(len(t), k) {
		out = append(out, t[i])
	}
	return string(out)
}

func decrypt(c string, k int) string {
	out := make([]byte, len(c))
	for pos, i := range order(len(c), k) {
		out[i] = c[pos]
	}
	return string(out)
}

func main() {
	c := encrypt("WEAREDISCOVERED", 3)
	fmt.Println(c, decrypt(c, 3))
}
