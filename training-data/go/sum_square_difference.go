// Square of the sum minus sum of squares for 1..10 (expect 2640)
package main

import "fmt"

func main() {
	sum, squares := 0, 0
	for i := 1; i <= 10; i++ {
		sum += i
		squares += i * i
	}
	fmt.Println(sum*sum - squares)
}
