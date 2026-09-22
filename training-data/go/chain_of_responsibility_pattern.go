package main

import "fmt"

type approver interface {
	setNext(next approver)
	approve(amount float64)
}

type baseApprover struct {
	next approver
}

func (b *baseApprover) setNext(next approver) {
	b.next = next
}

func (b *baseApprover) forward(amount float64) {
	if b.next != nil {
		b.next.approve(amount)
	} else {
		fmt.Printf("no one could approve %.2f\n", amount)
	}
}

type manager struct {
	baseApprover
}

func (m *manager) approve(amount float64) {
	if amount <= 1000 {
		fmt.Printf("manager approved %.2f\n", amount)
	} else {
		m.forward(amount)
	}
}

type director struct {
	baseApprover
}

func (d *director) approve(amount float64) {
	if amount <= 5000 {
		fmt.Printf("director approved %.2f\n", amount)
	} else {
		d.forward(amount)
	}
}

type vicePresident struct {
	baseApprover
}

func (v *vicePresident) approve(amount float64) {
	fmt.Printf("VP approved %.2f\n", amount)
}

func main() {
	m := &manager{}
	d := &director{}
	vp := &vicePresident{}
	m.setNext(d)
	d.setNext(vp)

	for _, amount := range []float64{500, 3000, 9000} {
		m.approve(amount)
	}
}
