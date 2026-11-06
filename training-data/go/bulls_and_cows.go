// Bulls and Cows scoring for equal-length digit strings.
package main

import "fmt"

func score(secret, guess string) (bulls, cows int) {
	var sc, gc [256]int
	for i := 0; i < len(secret); i++ {
		if secret[i] == guess[i] {
			bulls++
		} else {
			sc[secret[i]]++
			gc[guess[i]]++
		}
	}
	for c := range sc {
		cows += min(sc[c], gc[c])
	}
	return
}

func main() {
	b, c := score("1807", "7810")
	fmt.Printf("%d bull(s), %d cow(s)\n", b, c)
}
