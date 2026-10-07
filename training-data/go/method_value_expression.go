package main

import "fmt"

type Counter struct {
	n int
}

func (c *Counter) Add(k int) { c.n += k }
func (c Counter) Value() int { return c.n }

func apply(times int, f func(int)) {
	for i := 1; i <= times; i++ {
		f(i)
	}
}

func main() {
	c := &Counter{}

	// Method value: receiver is bound at evaluation time.
	add := c.Add
	apply(4, add)
	fmt.Println("after apply:", c.Value())

	// Method expression: receiver becomes the first argument.
	addExpr := (*Counter).Add
	addExpr(c, 10)
	valueExpr := Counter.Value
	fmt.Println("via expressions:", valueExpr(*c))

	// A value-receiver method value copies the receiver when bound.
	snapshot := c.Value
	c.Add(100)
	fmt.Println("snapshot:", snapshot(), "live:", c.Value())
}
