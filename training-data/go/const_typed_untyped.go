package main

import (
	"fmt"
	"math"
)

const (
	Big   = 1 << 100
	Small = Big >> 99
)

const Pi2 = math.Pi * 2

type Celsius float64

const Boiling Celsius = 100

func needFloat(x float64) float64 { return x * 0.1 }
func needInt(x int) int           { return x * 10 }

func main() {
	fmt.Println(Small)
	fmt.Println(needFloat(Big))
	fmt.Println(needInt(Small))
	fmt.Printf("%.4f\n", Pi2)
	fmt.Printf("%T %v\n", Boiling, Boiling+0.5)

	const x = 5
	var f float64 = x
	var i8 int8 = x
	fmt.Println(f, i8)
}
