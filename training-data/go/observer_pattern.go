package main

import "fmt"

type observer func(value float64)

type subject struct {
	observers []observer
}

func (s *subject) subscribe(o observer) {
	s.observers = append(s.observers, o)
}

func (s *subject) notify(value float64) {
	for _, o := range s.observers {
		o(value)
	}
}

type temperatureSensor struct {
	subject
}

func (ts *temperatureSensor) setTemperature(value float64) {
	ts.notify(value)
}

func main() {
	sensor := &temperatureSensor{}
	sensor.subscribe(func(t float64) { fmt.Printf("Alert: temperature is now %.1f\n", t) })
	sensor.setTemperature(25.5)
}
