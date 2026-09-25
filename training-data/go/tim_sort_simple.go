package main

import (
	"fmt"
	"math/rand"
	"slices"
)

const minRun = 32

func insertionSort(a []int) {
	for i := 1; i < len(a); i++ {
		key := a[i]
		j := i - 1
		for j >= 0 && a[j] > key {
			a[j+1] = a[j]
			j--
		}
		a[j+1] = key
	}
}

func merge(a, buf []int, mid int) {
	copy(buf, a)
	i, j, k := 0, mid, 0
	for i < mid && j < len(a) {
		if buf[i] <= buf[j] {
			a[k] = buf[i]
			i++
		} else {
			a[k] = buf[j]
			j++
		}
		k++
	}
	k += copy(a[k:], buf[i:mid])
	copy(a[k:], buf[j:len(a)])
}

func timSort(a []int) {
	n := len(a)
	for lo := 0; lo < n; lo += minRun {
		insertionSort(a[lo:min(lo+minRun, n)])
	}
	buf := make([]int, n)
	for size := minRun; size < n; size *= 2 {
		for lo := 0; lo+size < n; lo += 2 * size {
			hi := min(lo+2*size, n)
			merge(a[lo:hi], buf[:hi-lo], size)
		}
	}
}

func main() {
	r := rand.New(rand.NewSource(42))
	a := make([]int, 2000)
	for i := range a {
		a[i] = r.Intn(10000)
	}
	want := slices.Clone(a)
	slices.Sort(want)
	timSort(a)
	fmt.Println("matches slices.Sort:", slices.Equal(a, want))
}
