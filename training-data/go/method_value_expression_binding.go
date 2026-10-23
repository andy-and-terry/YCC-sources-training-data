package main

import "fmt"

type Counter struct{ n int }

func (c *Counter) Inc() { c.n++ }

func main() {
	c := &Counter{}
	inc := c.Inc // method value bound to c
	inc()
	inc()
	fmt.Println(c.n)

	expr := (*Counter).Inc // method expression takes receiver explicitly
	expr(c)
	fmt.Println(c.n)
}
