package main

import (
	"errors"
	"fmt"
	"sort"
)

type Product struct {
	SKU          string
	Name         string
	PriceCents   int
	ReorderLevel int
	Qty          int
}

type Inventory struct{ items map[string]*Product }

var (
	ErrUnknownSKU   = errors.New("unknown sku")
	ErrInsufficient = errors.New("insufficient stock")
)

func NewInventory() *Inventory { return &Inventory{items: map[string]*Product{}} }

func (inv *Inventory) Add(p Product) { inv.items[p.SKU] = &p }

func (inv *Inventory) Receive(sku string, qty int) error {
	p, ok := inv.items[sku]
	if !ok {
		return fmt.Errorf("%w: %s", ErrUnknownSKU, sku)
	}
	p.Qty += qty
	return nil
}

func (inv *Inventory) Sell(sku string, qty int) (int, error) {
	p, ok := inv.items[sku]
	if !ok {
		return 0, fmt.Errorf("%w: %s", ErrUnknownSKU, sku)
	}
	if p.Qty < qty {
		return 0, fmt.Errorf("%w: %s has %d", ErrInsufficient, p.Name, p.Qty)
	}
	p.Qty -= qty
	return qty * p.PriceCents, nil
}

func (inv *Inventory) ReorderList() []string {
	var out []string
	for _, p := range inv.items {
		if p.Qty <= p.ReorderLevel {
			out = append(out, p.Name)
		}
	}
	sort.Strings(out)
	return out
}

func main() {
	inv := NewInventory()
	inv.Add(Product{SKU: "A1", Name: "apple", PriceCents: 50, ReorderLevel: 10})
	inv.Add(Product{SKU: "P1", Name: "pear", PriceCents: 75, ReorderLevel: 5})
	inv.Receive("A1", 40)
	inv.Receive("P1", 8)
	r1, _ := inv.Sell("A1", 32)
	r2, _ := inv.Sell("P1", 2)
	_, err := inv.Sell("P1", 100)
	fmt.Printf("revenue %.2f, err=%v, reorder=%v\n", float64(r1+r2)/100, err, inv.ReorderList())
	fmt.Println(errors.Is(inv.Receive("X9", 1), ErrUnknownSKU))
}
