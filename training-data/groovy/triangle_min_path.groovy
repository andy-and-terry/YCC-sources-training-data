int minimumTotal(List<List<Integer>> t) {
    def dp = new ArrayList<Integer>(t.last())
    for (int r = t.size() - 2; r >= 0; r--) {
        t[r].eachWithIndex { v, i -> dp[i] = v + Math.min(dp[i], dp[i + 1]) }
    }
    dp[0]
}

println minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]) // 11
