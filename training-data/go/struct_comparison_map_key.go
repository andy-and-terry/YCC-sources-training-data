package main

import "fmt"

type Point struct{ X, Y int }

type Segment struct{ A, B Point }

func main() {
	p1, p2 := Point{1, 2}, Point{1, 2}
	fmt.Println(p1 == p2, p1 != Point{2, 1})

	visited := map[Point]bool{}
	visited[Point{0, 0}] = true
	visited[Point{1, 0}] = true
	fmt.Println(visited[Point{1, 0}], visited[Point{5, 5}], len(visited))

	segs := map[Segment]string{{Point{0, 0}, Point{1, 1}}: "diag"}
	fmt.Println(segs[Segment{Point{0, 0}, Point{1, 1}}])

	arrKey := map[[2]int]int{{1, 2}: 10}
	fmt.Println(arrKey[[2]int{1, 2}])
}
