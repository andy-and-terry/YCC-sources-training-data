public class ToeplitzCheck {
    static boolean isToeplitz(int[][] m) {
        for (int i = 1; i < m.length; i++)
            for (int j = 1; j < m[i].length; j++)
                if (m[i][j] != m[i - 1][j - 1]) return false;
        return true;
    }

    public static void main(String[] args) {
        System.out.println(isToeplitz(new int[][]{{1, 2, 3}, {4, 1, 2}, {5, 4, 1}}));
        System.out.println(isToeplitz(new int[][]{{1, 2}, {2, 2}}));
    }
}
