package main

import "fmt"

type lfuCache struct {
	capacity   int
	values     map[string]int
	freq       map[string]int
	freqGroups map[int]map[string]bool
	minFreq    int
}

func newLFUCache(capacity int) *lfuCache {
	return &lfuCache{
		capacity:   capacity,
		values:     make(map[string]int),
		freq:       make(map[string]int),
		freqGroups: make(map[int]map[string]bool),
	}
}

func (c *lfuCache) bump(key string) {
	f := c.freq[key]
	delete(c.freqGroups[f], key)
	if len(c.freqGroups[f]) == 0 && c.minFreq == f {
		c.minFreq++
	}
	c.freq[key] = f + 1
	if c.freqGroups[f+1] == nil {
		c.freqGroups[f+1] = make(map[string]bool)
	}
	c.freqGroups[f+1][key] = true
}

func (c *lfuCache) get(key string) (int, bool) {
	value, ok := c.values[key]
	if !ok {
		return 0, false
	}
	c.bump(key)
	return value, true
}

func (c *lfuCache) put(key string, value int) {
	if c.capacity <= 0 {
		return
	}
	if _, ok := c.values[key]; ok {
		c.values[key] = value
		c.bump(key)
		return
	}
	if len(c.values) >= c.capacity {
		for evictKey := range c.freqGroups[c.minFreq] {
			delete(c.freqGroups[c.minFreq], evictKey)
			delete(c.values, evictKey)
			delete(c.freq, evictKey)
			break
		}
	}
	c.values[key] = value
	c.freq[key] = 1
	if c.freqGroups[1] == nil {
		c.freqGroups[1] = make(map[string]bool)
	}
	c.freqGroups[1][key] = true
	c.minFreq = 1
}

func main() {
	cache := newLFUCache(2)
	cache.put("a", 1)
	cache.put("b", 2)
	cache.get("a")
	cache.put("c", 3)
	_, bOk := cache.get("b")
	aVal, _ := cache.get("a")
	cVal, _ := cache.get("c")
	fmt.Println(bOk, aVal, cVal)
}
