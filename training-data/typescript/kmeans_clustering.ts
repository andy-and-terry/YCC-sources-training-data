type Point = [number, number];

function distance(a: Point, b: Point): number {
  return Math.sqrt((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2);
}

function kmeans(points: Point[], k: number, iterations = 20): Point[] {
  let centroids: Point[] = points.slice(0, k);

  for (let iter = 0; iter < iterations; iter++) {
    const clusters: Point[][] = Array.from({ length: k }, () => []);
    for (const point of points) {
      let closest = 0;
      let minDist = Infinity;
      for (let i = 0; i < k; i++) {
        const d = distance(point, centroids[i]);
        if (d < minDist) {
          minDist = d;
          closest = i;
        }
      }
      clusters[closest].push(point);
    }

    centroids = clusters.map((cluster, i) => {
      if (cluster.length === 0) return centroids[i];
      const meanX = cluster.reduce((s, p) => s + p[0], 0) / cluster.length;
      const meanY = cluster.reduce((s, p) => s + p[1], 0) / cluster.length;
      return [meanX, meanY] as Point;
    });
  }

  return centroids;
}

const points: Point[] = [[1, 1], [1.5, 2], [3, 4], [5, 7], [3.5, 5], [4.5, 5], [3.5, 4.5]];
console.log(kmeans(points, 2));
