public class ChebyshevDistance {
    public static Integer chebyshev(List<Integer> a, List<Integer> b) {
        Integer m = 0;
        for (Integer i = 0; i < a.size(); i++) {
            m = Math.max(m, Math.abs(a[i] - b[i]));
        }
        return m;
    }
}
