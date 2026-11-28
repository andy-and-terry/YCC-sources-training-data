public class ManhattanDistance {
    public static Integer manhattan(List<Integer> a, List<Integer> b) {
        Integer s = 0;
        for (Integer i = 0; i < a.size(); i++) {
            s += Math.abs(a[i] - b[i]);
        }
        return s;
    }

    public static void demo() {
        System.debug(manhattan(new List<Integer>{1, 2}, new List<Integer>{4, 6}));
    }
}
