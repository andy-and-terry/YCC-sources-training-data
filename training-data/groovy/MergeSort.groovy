def merge(left, right) {
    def result = []
    int i = 0, j = 0
    while (i < left.size() && j < right.size()) {
        if (left[i] <= right[j]) {
            result << left[i++]
        } else {
            result << right[j++]
        }
    }
    result.addAll(left[i..<left.size()])
    result.addAll(right[j..<right.size()])
    return result
}

def mergeSort(items) {
    if (items.size() <= 1) return items
    int mid = items.size() / 2
    def left = mergeSort(items[0..<mid])
    def right = mergeSort(items[mid..<items.size()])
    return merge(left, right)
}

println mergeSort([5, 2, 9, 1, 5, 6])
