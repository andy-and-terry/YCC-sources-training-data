#[derive(Debug, Clone, Copy)]
struct Point {
    x: f64,
    y: f64,
}

fn distance(a: Point, b: Point) -> f64 {
    ((a.x - b.x).powi(2) + (a.y - b.y).powi(2)).sqrt()
}

fn kmeans(points: &[Point], k: usize, iterations: usize) -> Vec<Point> {
    let mut centroids: Vec<Point> = points[..k].to_vec();

    for _ in 0..iterations {
        let mut clusters: Vec<Vec<Point>> = vec![vec![]; k];
        for &p in points {
            let mut closest = 0;
            let mut min_dist = f64::MAX;
            for (i, &c) in centroids.iter().enumerate() {
                let d = distance(p, c);
                if d < min_dist {
                    min_dist = d;
                    closest = i;
                }
            }
            clusters[closest].push(p);
        }

        for (i, cluster) in clusters.iter().enumerate() {
            if cluster.is_empty() {
                continue;
            }
            let sum_x: f64 = cluster.iter().map(|p| p.x).sum();
            let sum_y: f64 = cluster.iter().map(|p| p.y).sum();
            centroids[i] = Point { x: sum_x / cluster.len() as f64, y: sum_y / cluster.len() as f64 };
        }
    }
    centroids
}

fn main() {
    let points = vec![
        Point { x: 1.0, y: 1.0 }, Point { x: 1.5, y: 2.0 }, Point { x: 3.0, y: 4.0 },
        Point { x: 5.0, y: 7.0 }, Point { x: 3.5, y: 5.0 }, Point { x: 4.5, y: 5.0 }, Point { x: 3.5, y: 4.5 },
    ];
    println!("{:?}", kmeans(&points, 2, 20));
}
