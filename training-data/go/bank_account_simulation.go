package main

import (
	"errors"
	"fmt"
	"math/rand"
	"sync"
)

var ErrInsufficient = errors.New("insufficient funds")

type Account struct {
	id      int
	mu      sync.Mutex
	balance int64
}

type Bank struct{ accounts []*Account }

// Transfer locks both accounts in id order so concurrent transfers cannot deadlock.
func (b *Bank) Transfer(from, to int, amount int64) error {
	if from == to {
		return nil
	}
	a, c := b.accounts[from], b.accounts[to]
	first, second := a, c
	if c.id < a.id {
		first, second = c, a
	}
	first.mu.Lock()
	defer first.mu.Unlock()
	second.mu.Lock()
	defer second.mu.Unlock()
	if a.balance < amount {
		return fmt.Errorf("account %d: %w", from, ErrInsufficient)
	}
	a.balance -= amount
	c.balance += amount
	return nil
}

func main() {
	bank := &Bank{}
	for i := 0; i < 5; i++ {
		bank.accounts = append(bank.accounts, &Account{id: i, balance: 1000})
	}
	var wg sync.WaitGroup
	var rejected int64
	var mu sync.Mutex
	for w := 0; w < 8; w++ {
		wg.Add(1)
		go func(seed int64) {
			defer wg.Done()
			r := rand.New(rand.NewSource(seed))
			for i := 0; i < 20000; i++ {
				if err := bank.Transfer(r.Intn(5), r.Intn(5), int64(r.Intn(100))); errors.Is(err, ErrInsufficient) {
					mu.Lock()
					rejected++
					mu.Unlock()
				}
			}
		}(int64(w))
	}
	wg.Wait()
	var total int64
	for _, a := range bank.accounts {
		total += a.balance
	}
	fmt.Println("total:", total, "rejected:", rejected)
}
