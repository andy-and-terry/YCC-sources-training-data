package main

import "fmt"

type Unit byte

const (
	Celsius    Unit = 'C'
	Fahrenheit Unit = 'F'
	Kelvin     Unit = 'K'
)

func toCelsius(v float64, u Unit) float64 {
	switch u {
	case Fahrenheit:
		return (v - 32) * 5 / 9
	case Kelvin:
		return v - 273.15
	}
	return v
}

func fromCelsius(v float64, u Unit) float64 {
	switch u {
	case Fahrenheit:
		return v*9/5 + 32
	case Kelvin:
		return v + 273.15
	}
	return v
}

func Convert(v float64, from, to Unit) float64 { return fromCelsius(toCelsius(v, from), to) }

func main() {
	fmt.Printf("%.2f %.2f\n", Convert(100, Celsius, Fahrenheit), Convert(212, Fahrenheit, Kelvin))
}
