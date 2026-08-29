public class NQueens {
    public static Integer countSolutions(Integer n) {
        return solve(new List<Integer>(), n);
    }

    private static Integer solve(List<Integer> placement, Integer n) {
        if (placement.size() == n) {
            return 1;
        }
        Integer count = 0;
        for (Integer col = 0; col < n; col++) {
            if (isSafe(placement, col)) {
                placement.add(col);
                count += solve(placement, n);
                placement.remove(placement.size() - 1);
            }
        }
        return count;
    }

    private static Boolean isSafe(List<Integer> placement, Integer col) {
        Integer row = placement.size();
        for (Integer r = 0; r < row; r++) {
            Integer c = placement[r];
            if (c == col || Math.abs(c - col) == Math.abs(r - row)) {
                return false;
            }
        }
        return true;
    }

    public static void main() {
        System.debug(countSolutions(6));
    }
}
