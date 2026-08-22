package main

import "fmt"

type HashMap struct {
	data map[string]int
}

func NewHashMap() *HashMap {
	return &HashMap{data: make(map[string]int)}
}

func (h *HashMap) Set(key string, value int) {
	h.data[key] = value
}

func (h *HashMap) Get(key string) (int, bool) {
	value, ok := h.data[key]
	return value, ok
}

func main() {
	m := NewHashMap()
	m.Set("a", 1)
	m.Set("b", 2)
	v, ok := m.Get("a")
	fmt.Println(v, ok)
}
