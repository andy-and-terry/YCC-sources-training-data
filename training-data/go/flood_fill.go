package main

import "fmt"

func floodFill(img [][]byte, r, c int, color byte) int {
	target := img[r][c]
	if target == color {
		return 0
	}
	var fill func(r, c int) int
	fill = func(r, c int) int {
		if r < 0 || c < 0 || r >= len(img) || c >= len(img[r]) || img[r][c] != target {
			return 0
		}
		img[r][c] = color
		return 1 + fill(r+1, c) + fill(r-1, c) + fill(r, c+1) + fill(r, c-1)
	}
	return fill(r, c)
}

func main() {
	img := [][]byte{[]byte("..####.."), []byte(".#....#."), []byte(".#....#."), []byte("..####..")}
	fmt.Println("filled", floodFill(img, 1, 3, 'o'))
	for _, row := range img {
		fmt.Println(string(row))
	}
}
