import java.util.Map;
import java.util.TreeMap;

public class SparseMatrix {
    private final int rows, cols;
    private final Map<Integer, Map<Integer, Double>> data = new TreeMap<>();

    public SparseMatrix(int rows, int cols) {
        this.rows = rows;
        this.cols = cols;
    }

    public void set(int r, int c, double v) {
        if (v == 0) {
            Map<Integer, Double> row = data.get(r);
            if (row != null) row.remove(c);
        } else {
            data.computeIfAbsent(r, k -> new TreeMap<>()).put(c, v);
        }
    }

    public double get(int r, int c) {
        return data.getOrDefault(r, Map.of()).getOrDefault(c, 0.0);
    }

    public SparseMatrix multiply(SparseMatrix o) {
        SparseMatrix out = new SparseMatrix(rows, o.cols);
        data.forEach((r, row) -> row.forEach((k, v) ->
                o.data.getOrDefault(k, Map.of()).forEach((c, w) -> out.set(r, c, out.get(r, c) + v * w))));
        return out;
    }

    public int nonZeros() {
        return data.values().stream().mapToInt(Map::size).sum();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) sb.append(String.format("%5.1f", get(r, c)));
            sb.append('\n');
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        SparseMatrix a = new SparseMatrix(3, 3), b = new SparseMatrix(3, 3);
        a.set(0, 0, 1); a.set(1, 2, 2); a.set(2, 1, 3);
        b.set(0, 1, 4); b.set(1, 0, 5); b.set(2, 2, 6);
        SparseMatrix p = a.multiply(b);
        System.out.print(p);
        System.out.println("nnz=" + p.nonZeros());
    }
}
