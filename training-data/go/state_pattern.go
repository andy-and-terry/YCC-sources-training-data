package main

import "fmt"

type orderState interface {
	next(o *order)
	name() string
}

type pendingState struct{}

func (pendingState) next(o *order) { o.state = shippedState{} }
func (pendingState) name() string  { return "pending" }

type shippedState struct{}

func (shippedState) next(o *order) { o.state = deliveredState{} }
func (shippedState) name() string  { return "shipped" }

type deliveredState struct{}

func (deliveredState) next(o *order) { }
func (deliveredState) name() string  { return "delivered" }

type order struct {
	state orderState
}

func newOrder() *order {
	return &order{state: pendingState{}}
}

func (o *order) advance() {
	o.state.next(o)
}

func main() {
	o := newOrder()
	fmt.Println(o.state.name())
	o.advance()
	fmt.Println(o.state.name())
	o.advance()
	fmt.Println(o.state.name())
	o.advance()
	fmt.Println(o.state.name())
}
