public class TriangularNumbers {
    public static List<Integer> triangular(Integer count) {
        List<Integer> out = new List<Integer>();
        Integer total = 0;
        for (Integer n = 1; n <= count; n++) {
            total += n;
            out.add(total);
        }
        return out;
    }
}
