package main

import "fmt"

// balanced streams all balanced strings over a channel.
func balanced(n int) <-chan string {
	ch := make(chan string)
	var gen func(buf []byte, open, closed int)
	gen = func(buf []byte, open, closed int) {
		if len(buf) == 2*n {
			ch <- string(buf)
			return
		}
		if open < n {
			gen(append(buf, '('), open+1, closed)
		}
		if closed < open {
			gen(append(buf, ')'), open, closed+1)
		}
	}
	go func() {
		defer close(ch)
		gen(make([]byte, 0, 2*n), 0, 0)
	}()
	return ch
}

func main() {
	for s := range balanced(3) {
		fmt.Print(s, " ")
	}
	count := 0
	for range balanced(10) {
		count++
	}
	fmt.Println("\nn=10:", count)
}
