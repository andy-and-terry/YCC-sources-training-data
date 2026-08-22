package main

import (
	"fmt"
	"time"
)

type tokenBucket struct {
	capacity   float64
	tokens     float64
	refillRate float64
	lastRefill time.Time
}

func newTokenBucket(capacity, refillRate float64) *tokenBucket {
	return &tokenBucket{capacity: capacity, tokens: capacity, refillRate: refillRate, lastRefill: time.Now()}
}

func (tb *tokenBucket) refill() {
	now := time.Now()
	elapsed := now.Sub(tb.lastRefill).Seconds()
	tb.tokens += elapsed * tb.refillRate
	if tb.tokens > tb.capacity {
		tb.tokens = tb.capacity
	}
	tb.lastRefill = now
}

func (tb *tokenBucket) tryConsume(amount float64) bool {
	tb.refill()
	if tb.tokens >= amount {
		tb.tokens -= amount
		return true
	}
	return false
}

func main() {
	bucket := newTokenBucket(5, 1)
	for i := 0; i < 7; i++ {
		fmt.Print(bucket.tryConsume(1), " ")
	}
	fmt.Println()
}
