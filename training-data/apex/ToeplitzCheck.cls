public class ToeplitzCheck {
    public static Boolean isToeplitz(List<List<Integer>> m) {
        for (Integer i = 1; i < m.size(); i++) {
            for (Integer j = 1; j < m[i].size(); j++) {
                if (m[i][j] != m[i - 1][j - 1]) return false;
            }
        }
        return true;
    }
}
