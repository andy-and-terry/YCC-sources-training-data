package main

import "fmt"

func duval(s string) []string {
	var out []string
	n, i := len(s), 0
	for i < n {
		j, k := i+1, i
		for j < n && s[k] <= s[j] {
			if s[k] < s[j] {
				k = i
			} else {
				k++
			}
			j++
		}
		for i <= k {
			out = append(out, s[i:i+j-k])
			i += j - k
		}
	}
	return out
}

func main() { fmt.Println(duval("banana")) }
