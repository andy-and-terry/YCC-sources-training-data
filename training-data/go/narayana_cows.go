// Narayana's cows N(n)=N(n-1)+N(n-3)
package main

import "fmt"

func main() {
	v := []int{1, 1, 1}
	for i := 3; i < 10; i++ {
		v = append(v, v[i-1]+v[i-3])
	}
	fmt.Println(v)
}
