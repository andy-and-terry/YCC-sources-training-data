package main

import (
	"context"
	"errors"
	"fmt"
	"sync"
	"time"
)

type Group struct {
	wg     sync.WaitGroup
	once   sync.Once
	err    error
	cancel context.CancelFunc
}

func WithContext(ctx context.Context) (*Group, context.Context) {
	ctx, cancel := context.WithCancel(ctx)
	return &Group{cancel: cancel}, ctx
}

func (g *Group) Go(f func() error) {
	g.wg.Add(1)
	go func() {
		defer g.wg.Done()
		if err := f(); err != nil {
			g.once.Do(func() {
				g.err = err
				g.cancel()
			})
		}
	}()
}

func (g *Group) Wait() error {
	g.wg.Wait()
	g.cancel()
	return g.err
}

func main() {
	g, ctx := WithContext(context.Background())
	for i := 0; i < 3; i++ {
		g.Go(func() error {
			select {
			case <-time.After(time.Duration(i*20) * time.Millisecond):
				if i == 1 {
					return errors.New("task 1 failed")
				}
				return nil
			case <-ctx.Done():
				return ctx.Err()
			}
		})
	}
	fmt.Println("result:", g.Wait())
}
