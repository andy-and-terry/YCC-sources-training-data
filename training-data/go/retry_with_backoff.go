package main

import (
	"context"
	"errors"
	"fmt"
	"math/rand"
	"time"
)

var errTransient = errors.New("transient failure")

// Retry calls op until it succeeds, the context ends, or attempts run out.
func Retry(ctx context.Context, attempts int, base, cap time.Duration, op func() error) error {
	var err error
	for i := 1; i <= attempts; i++ {
		if err = op(); err == nil || !errors.Is(err, errTransient) {
			return err
		}
		if i == attempts {
			break
		}
		ceiling := min(cap, base<<i)
		delay := time.Duration(rand.Int63n(int64(ceiling) + 1))
		fmt.Printf("attempt %d failed: %v; retrying in %v\n", i, err, delay.Round(time.Millisecond))
		select {
		case <-time.After(delay):
		case <-ctx.Done():
			return ctx.Err()
		}
	}
	return fmt.Errorf("gave up after %d attempts: %w", attempts, err)
}

func main() {
	calls := 0
	err := Retry(context.Background(), 5, 10*time.Millisecond, 200*time.Millisecond, func() error {
		calls++
		if calls < 4 {
			return errTransient
		}
		return nil
	})
	fmt.Println("result:", err, "calls:", calls)

	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Millisecond)
	defer cancel()
	err = Retry(ctx, 10, 50*time.Millisecond, time.Second, func() error { return errTransient })
	fmt.Println("with timeout:", err)
}
