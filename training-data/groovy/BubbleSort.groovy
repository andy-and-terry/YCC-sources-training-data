def bubbleSort(arr) {
    def a = arr.clone()
    for (i in 0..<a.size()) {
        for (j in 0..<(a.size() - i - 1)) {
            if (a[j] > a[j + 1]) {
                def temp = a[j]
                a[j] = a[j + 1]
                a[j + 1] = temp
            }
        }
    }
    return a
}

println bubbleSort([5, 2, 9, 1, 5, 6])
