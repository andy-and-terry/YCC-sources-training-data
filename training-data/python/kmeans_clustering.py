import random
from typing import List, Tuple

Point = Tuple[float, float]


def distance(a: Point, b: Point) -> float:
    return ((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2) ** 0.5


def kmeans(points: List[Point], k: int, iterations: int = 20) -> List[Point]:
    centroids = random.sample(points, k)

    for _ in range(iterations):
        clusters: List[List[Point]] = [[] for _ in range(k)]
        for point in points:
            closest = min(range(k), key=lambda i: distance(point, centroids[i]))
            clusters[closest].append(point)

        new_centroids = []
        for i, cluster in enumerate(clusters):
            if cluster:
                mean_x = sum(p[0] for p in cluster) / len(cluster)
                mean_y = sum(p[1] for p in cluster) / len(cluster)
                new_centroids.append((mean_x, mean_y))
            else:
                new_centroids.append(centroids[i])
        centroids = new_centroids

    return centroids


if __name__ == "__main__":
    random.seed(42)
    points = [(1, 1), (1.5, 2), (3, 4), (5, 7), (3.5, 5), (4.5, 5), (3.5, 4.5)]
    print(kmeans(points, 2))
