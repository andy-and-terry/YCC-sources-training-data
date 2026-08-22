package main

import (
	"fmt"
	"math"
)

type point struct {
	x, y float64
}

func distance(a, b point) float64 {
	return math.Sqrt((a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y))
}

func kmeans(points []point, k, iterations int) []point {
	centroids := append([]point(nil), points[:k]...)

	for iter := 0; iter < iterations; iter++ {
		clusters := make([][]point, k)
		for _, p := range points {
			closest := 0
			minDist := math.MaxFloat64
			for i := 0; i < k; i++ {
				d := distance(p, centroids[i])
				if d < minDist {
					minDist = d
					closest = i
				}
			}
			clusters[closest] = append(clusters[closest], p)
		}

		for i, cluster := range clusters {
			if len(cluster) == 0 {
				continue
			}
			var sumX, sumY float64
			for _, p := range cluster {
				sumX += p.x
				sumY += p.y
			}
			centroids[i] = point{sumX / float64(len(cluster)), sumY / float64(len(cluster))}
		}
	}
	return centroids
}

func main() {
	points := []point{{1, 1}, {1.5, 2}, {3, 4}, {5, 7}, {3.5, 5}, {4.5, 5}, {3.5, 4.5}}
	fmt.Println(kmeans(points, 2, 20))
}
