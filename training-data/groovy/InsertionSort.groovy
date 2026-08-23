def insertionSort(items) {
    def arr = new ArrayList(items)
    for (int i = 1; i < arr.size(); i++) {
        def key = arr[i]
        int j = i - 1
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j]
            j--
        }
        arr[j + 1] = key
    }
    return arr
}

println insertionSort([12, 11, 13, 5, 6])
