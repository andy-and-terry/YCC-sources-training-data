package main

import "fmt"

func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func path(p, q int) string {
	g := gcd(p, q)
	p, q = p/g, q/g
	lp, lq, hp, hq := 0, 1, 1, 0
	var s []byte
	for {
		mp, mq := lp+hp, lq+hq
		if mp == p && mq == q {
			return string(s)
		}
		if p*mq < mp*q {
			s = append(s, 'L')
			hp, hq = mp, mq
		} else {
			s = append(s, 'R')
			lp, lq = mp, mq
		}
	}
}

func main() {
	fmt.Println(path(3, 5))
}
