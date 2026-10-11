package main

import (
	"fmt"
	"time"
)

type entry[V any] struct {
	val     V
	expires time.Time
}

type TTLCache[K comparable, V any] struct {
	data map[K]entry[V]
	ttl  time.Duration
	now  func() time.Time
}

func NewTTLCache[K comparable, V any](ttl time.Duration) *TTLCache[K, V] {
	return &TTLCache[K, V]{data: map[K]entry[V]{}, ttl: ttl, now: time.Now}
}

func (c *TTLCache[K, V]) Set(k K, v V) {
	c.data[k] = entry[V]{v, c.now().Add(c.ttl)}
}

func (c *TTLCache[K, V]) Get(k K) (V, bool) {
	e, ok := c.data[k]
	if !ok || c.now().After(e.expires) {
		delete(c.data, k)
		var zero V
		return zero, false
	}
	return e.val, true
}

func main() {
	clock := time.Date(2024, 1, 1, 0, 0, 0, 0, time.UTC)
	c := NewTTLCache[string, int](time.Minute)
	c.now = func() time.Time { return clock }
	c.Set("a", 1)
	fmt.Println(c.Get("a"))
	clock = clock.Add(2 * time.Minute)
	fmt.Println(c.Get("a"))
}
