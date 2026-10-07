package main

import "fmt"

type Point struct{ Row, Col int }

func saddlePoints(m [][]int) []Point {
	if len(m) == 0 {
		return nil
	}
	colMin := append([]int(nil), m[0]...)
	for _, row := range m[1:] {
		for c, v := range row {
			colMin[c] = min(colMin[c], v)
		}
	}
	var pts []Point
	for r, row := range m {
		rowMax := row[0]
		for _, v := range row {
			rowMax = max(rowMax, v)
		}
		for c, v := range row {
			if v == rowMax && v == colMin[c] {
				pts = append(pts, Point{r, c})
			}
		}
	}
	return pts
}

func main() {
	fmt.Println(saddlePoints([][]int{{9, 8, 7}, {5, 3, 2}, {6, 6, 7}}))
}
