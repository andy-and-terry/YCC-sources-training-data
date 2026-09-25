package main

import "fmt"

type sq struct{ x, y int }

func (s sq) String() string { return fmt.Sprintf("%c%d", 'a'+s.x, s.y+1) }

func knightPath(from, to sq) []sq {
	moves := []sq{{1, 2}, {2, 1}, {2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}}
	prev := map[sq]sq{from: from}
	queue := []sq{from}
	for len(queue) > 0 {
		cur := queue[0]
		queue = queue[1:]
		if cur == to {
			break
		}
		for _, m := range moves {
			n := sq{cur.x + m.x, cur.y + m.y}
			if n.x < 0 || n.x > 7 || n.y < 0 || n.y > 7 {
				continue
			}
			if _, seen := prev[n]; !seen {
				prev[n] = cur
				queue = append(queue, n)
			}
		}
	}
	path := []sq{to}
	for cur := to; cur != from; {
		cur = prev[cur]
		path = append([]sq{cur}, path...)
	}
	return path
}

func main() {
	for _, pair := range [][2]sq{{{0, 0}, {7, 7}}, {{0, 0}, {1, 1}}} {
		p := knightPath(pair[0], pair[1])
		fmt.Println(len(p)-1, "moves:", p)
	}
}
