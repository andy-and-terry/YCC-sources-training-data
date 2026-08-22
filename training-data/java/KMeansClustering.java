import java.util.ArrayList;
import java.util.List;

public class KMeansClustering {
    record Point(double x, double y) {}

    private static double distance(Point a, Point b) {
        return Math.sqrt(Math.pow(a.x() - b.x(), 2) + Math.pow(a.y() - b.y(), 2));
    }

    public static List<Point> kmeans(List<Point> points, int k, int iterations) {
        List<Point> centroids = new ArrayList<>(points.subList(0, k));

        for (int iter = 0; iter < iterations; iter++) {
            List<List<Point>> clusters = new ArrayList<>();
            for (int i = 0; i < k; i++) clusters.add(new ArrayList<>());

            for (Point point : points) {
                int closest = 0;
                double minDist = Double.MAX_VALUE;
                for (int i = 0; i < k; i++) {
                    double d = distance(point, centroids.get(i));
                    if (d < minDist) {
                        minDist = d;
                        closest = i;
                    }
                }
                clusters.get(closest).add(point);
            }

            List<Point> newCentroids = new ArrayList<>();
            for (int i = 0; i < k; i++) {
                List<Point> cluster = clusters.get(i);
                if (cluster.isEmpty()) {
                    newCentroids.add(centroids.get(i));
                    continue;
                }
                double meanX = cluster.stream().mapToDouble(Point::x).average().orElse(0);
                double meanY = cluster.stream().mapToDouble(Point::y).average().orElse(0);
                newCentroids.add(new Point(meanX, meanY));
            }
            centroids = newCentroids;
        }
        return centroids;
    }

    public static void main(String[] args) {
        List<Point> points = List.of(
            new Point(1, 1), new Point(1.5, 2), new Point(3, 4),
            new Point(5, 7), new Point(3.5, 5), new Point(4.5, 5), new Point(3.5, 4.5)
        );
        System.out.println(kmeans(points, 2, 20));
    }
}
