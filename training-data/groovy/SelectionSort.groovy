def selectionSort(items) {
    def arr = new ArrayList(items)
    for (int i = 0; i < arr.size() - 1; i++) {
        int minIdx = i
        for (int j = i + 1; j < arr.size(); j++) {
            if (arr[j] < arr[minIdx]) minIdx = j
        }
        def tmp = arr[i]
        arr[i] = arr[minIdx]
        arr[minIdx] = tmp
    }
    return arr
}

println selectionSort([5, 3, 8, 1, 9, 2])
