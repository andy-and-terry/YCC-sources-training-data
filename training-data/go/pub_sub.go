package main

import "fmt"

type pubSub struct {
	subscribers map[string][]func(string)
}

func newPubSub() *pubSub {
	return &pubSub{subscribers: make(map[string][]func(string))}
}

func (ps *pubSub) subscribe(topic string, handler func(string)) {
	ps.subscribers[topic] = append(ps.subscribers[topic], handler)
}

func (ps *pubSub) publish(topic, message string) {
	for _, handler := range ps.subscribers[topic] {
		handler(message)
	}
}

func main() {
	bus := newPubSub()
	bus.subscribe("news", func(msg string) { fmt.Println("received:", msg) })
	bus.publish("news", "hello subscribers")
}
