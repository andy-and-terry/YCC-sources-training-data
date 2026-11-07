List<Integer> plusOne(List<Integer> digits) {
    def d = new ArrayList<Integer>(digits)
    for (int i = d.size() - 1; i >= 0; i--) {
        if (d[i] < 9) { d[i] = d[i] + 1; return d }
        d[i] = 0
    }
    [1] + d
}

println plusOne([1, 2, 9]) // [1, 3, 0]
println plusOne([9, 9])    // [1, 0, 0]
