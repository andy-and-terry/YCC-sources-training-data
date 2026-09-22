package main

import "fmt"

type service interface {
	request(id int) string
}

type realService struct{}

func (realService) request(id int) string {
	return fmt.Sprintf("processed request %d", id)
}

type cachingProxy struct {
	real  service
	cache map[int]string
}

func newCachingProxy(real service) *cachingProxy {
	return &cachingProxy{real: real, cache: make(map[int]string)}
}

func (p *cachingProxy) request(id int) string {
	if v, ok := p.cache[id]; ok {
		return "[cached] " + v
	}
	result := p.real.request(id)
	p.cache[id] = result
	return result
}

func main() {
	proxy := newCachingProxy(realService{})
	fmt.Println(proxy.request(1))
	fmt.Println(proxy.request(1))
	fmt.Println(proxy.request(2))
}
