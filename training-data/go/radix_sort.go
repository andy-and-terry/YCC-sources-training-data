package main

import "fmt"

func radixSort(items []int) []int {
	if len(items) == 0 {
		return items
	}
	arr := append([]int(nil), items...)
	max := arr[0]
	for _, x := range arr {
		if x > max {
			max = x
		}
	}
	for exp := 1; max/exp > 0; exp *= 10 {
		buckets := make([][]int, 10)
		for _, x := range arr {
			digit := (x / exp) % 10
			buckets[digit] = append(buckets[digit], x)
		}
		arr = arr[:0]
		for _, bucket := range buckets {
			arr = append(arr, bucket...)
		}
	}
	return arr
}

func main() {
	fmt.Println(radixSort([]int{170, 45, 75, 90, 802, 24, 2, 66}))
}
