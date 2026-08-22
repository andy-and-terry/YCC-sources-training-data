package main

import (
	"errors"
	"fmt"
	"time"
)

type circuitState int

const (
	closed circuitState = iota
	open
	halfOpen
)

type circuitBreaker struct {
	failureThreshold int
	resetTimeout     time.Duration
	failures         int
	state            circuitState
	openedAt         time.Time
}

func newCircuitBreaker(threshold int, timeout time.Duration) *circuitBreaker {
	return &circuitBreaker{failureThreshold: threshold, resetTimeout: timeout, state: closed}
}

func (cb *circuitBreaker) call(fn func() error) error {
	if cb.state == open {
		if time.Since(cb.openedAt) >= cb.resetTimeout {
			cb.state = halfOpen
		} else {
			return errors.New("circuit is open")
		}
	}

	err := fn()
	if err != nil {
		cb.failures++
		if cb.failures >= cb.failureThreshold {
			cb.state = open
			cb.openedAt = time.Now()
		}
		return err
	}
	cb.failures = 0
	cb.state = closed
	return nil
}

func main() {
	breaker := newCircuitBreaker(2, 100*time.Millisecond)
	for i := 0; i < 2; i++ {
		_ = breaker.call(func() error { return errors.New("fail") })
	}
	fmt.Println(breaker.state == open)
}
