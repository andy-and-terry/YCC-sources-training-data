package main

import "fmt"

// maxFloors returns how many floors can be fully resolved with e eggs and m drops.
func maxFloors(e, m int) uint64 {
	f := make([]uint64, e+1)
	for move := 0; move < m; move++ {
		for k := e; k > 0; k-- {
			f[k] += f[k-1] + 1
		}
	}
	return f[e]
}

func eggDrop(eggs int, floors uint64) int {
	m := 0
	for maxFloors(eggs, m) < floors {
		m++
	}
	return m
}

func main() {
	fmt.Println(eggDrop(1, 10), eggDrop(2, 100), eggDrop(3, 1000), eggDrop(20, 1e12))
	fmt.Println("2 eggs, 14 drops cover", maxFloors(2, 14), "floors")
}
