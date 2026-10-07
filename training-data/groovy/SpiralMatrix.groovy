def spiral(List<List<Integer>> m) {
    def out = []
    int top = 0, bottom = m.size() - 1, left = 0, right = m[0].size() - 1
    while (top <= bottom && left <= right) {
        (left..right).each { out << m[top][it] }
        top++
        (top..bottom).each { out << m[it][right] }
        right--
        if (top <= bottom) {
            right.downto(left) { out << m[bottom][it] }
            bottom--
        }
        if (left <= right) {
            bottom.downto(top) { out << m[it][left] }
            left++
        }
    }
    out
}

println spiral([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
