package main

import (
	"container/list"
	"fmt"
)

type entry struct {
	key   string
	value int
}

type lruCache struct {
	capacity int
	items    map[string]*list.Element
	order    *list.List
}

func newLRUCache(capacity int) *lruCache {
	return &lruCache{
		capacity: capacity,
		items:    make(map[string]*list.Element),
		order:    list.New(),
	}
}

func (c *lruCache) Get(key string) (int, bool) {
	elem, ok := c.items[key]
	if !ok {
		return 0, false
	}
	c.order.MoveToFront(elem)
	return elem.Value.(*entry).value, true
}

func (c *lruCache) Put(key string, value int) {
	if elem, ok := c.items[key]; ok {
		elem.Value.(*entry).value = value
		c.order.MoveToFront(elem)
		return
	}
	if c.order.Len() >= c.capacity {
		oldest := c.order.Back()
		if oldest != nil {
			c.order.Remove(oldest)
			delete(c.items, oldest.Value.(*entry).key)
		}
	}
	elem := c.order.PushFront(&entry{key: key, value: value})
	c.items[key] = elem
}

func main() {
	cache := newLRUCache(2)
	cache.Put("a", 1)
	cache.Put("b", 2)
	cache.Get("a")
	cache.Put("c", 3)
	_, bOk := cache.Get("b")
	aVal, _ := cache.Get("a")
	cVal, _ := cache.Get("c")
	fmt.Println(bOk, aVal, cVal)
}
