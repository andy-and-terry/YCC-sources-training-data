// Perrin sequence P(n)=P(n-2)+P(n-3)
package main

import "fmt"

func main() {
	v := []int{3, 0, 2}
	for i := 3; i < 10; i++ {
		v = append(v, v[i-2]+v[i-3])
	}
	fmt.Println(v)
}
