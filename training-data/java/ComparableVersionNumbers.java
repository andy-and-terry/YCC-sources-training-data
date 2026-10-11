import java.util.Arrays;

public class ComparableVersionNumbers implements Comparable<ComparableVersionNumbers> {
    private final int[] parts;

    ComparableVersionNumbers(String text) {
        parts = Arrays.stream(text.split("\\.")).mapToInt(Integer::parseInt).toArray();
    }

    @Override
    public int compareTo(ComparableVersionNumbers other) {
        int n = Math.max(parts.length, other.parts.length);
        for (int i = 0; i < n; i++) {
            int a = i < parts.length ? parts[i] : 0;
            int b = i < other.parts.length ? other.parts[i] : 0;
            if (a != b) return Integer.compare(a, b);
        }
        return 0;
    }

    @Override
    public String toString() {
        return Arrays.toString(parts);
    }

    public static void main(String[] args) {
        ComparableVersionNumbers[] versions = {
            new ComparableVersionNumbers("1.10"),
            new ComparableVersionNumbers("1.2.1"),
            new ComparableVersionNumbers("1.2"),
            new ComparableVersionNumbers("1.2.0")
        };
        Arrays.sort(versions);
        System.out.println(Arrays.toString(versions));
        System.out.println(versions[1].compareTo(versions[2]));
    }
}
