package main

import (
	"errors"
	"fmt"
	"sync"
)

var ErrInsufficient = errors.New("insufficient funds")

type Account struct {
	mu      sync.Mutex
	balance int64
}

func (a *Account) Deposit(n int64) {
	a.mu.Lock()
	defer a.mu.Unlock()
	a.balance += n
}

func (a *Account) Withdraw(n int64) error {
	a.mu.Lock()
	defer a.mu.Unlock()
	if n > a.balance {
		return ErrInsufficient
	}
	a.balance -= n
	return nil
}

func (a *Account) Balance() int64 {
	a.mu.Lock()
	defer a.mu.Unlock()
	return a.balance
}

func main() {
	var acct Account
	var wg sync.WaitGroup
	for i := 0; i < 100; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			acct.Deposit(10)
		}()
	}
	wg.Wait()
	fmt.Println(acct.Balance(), acct.Withdraw(5000))
}
