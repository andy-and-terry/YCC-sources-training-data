package main

import (
	"container/list"
	"fmt"
)

type lruEntry struct {
	key, value int
}

type LRUCache struct {
	capacity int
	items    map[int]*list.Element
	order    *list.List
}

func NewLRUCache(capacity int) *LRUCache {
	return &LRUCache{
		capacity: capacity,
		items:    make(map[int]*list.Element),
		order:    list.New(),
	}
}

func (c *LRUCache) Get(key int) (int, bool) {
	el, ok := c.items[key]
	if !ok {
		return 0, false
	}
	c.order.MoveToFront(el)
	return el.Value.(*lruEntry).value, true
}

func (c *LRUCache) Put(key, value int) {
	if el, ok := c.items[key]; ok {
		el.Value.(*lruEntry).value = value
		c.order.MoveToFront(el)
		return
	}
	if c.order.Len() >= c.capacity {
		oldest := c.order.Back()
		if oldest != nil {
			c.order.Remove(oldest)
			delete(c.items, oldest.Value.(*lruEntry).key)
		}
	}
	el := c.order.PushFront(&lruEntry{key: key, value: value})
	c.items[key] = el
}

func main() {
	cache := NewLRUCache(2)
	cache.Put(1, 100)
	cache.Put(2, 200)
	fmt.Println(cache.Get(1))
	cache.Put(3, 300)
	_, ok := cache.Get(2)
	fmt.Println(ok)
	fmt.Println(cache.Get(3))
}
