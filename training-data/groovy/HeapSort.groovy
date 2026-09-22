def heapify(List arr, int n, int i) {
    int largest = i
    int left = 2 * i + 1
    int right = 2 * i + 2
    if (left < n && arr[left] > arr[largest]) largest = left
    if (right < n && arr[right] > arr[largest]) largest = right
    if (largest != i) {
        def tmp = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        heapify(arr, n, largest)
    }
}

def heapSort(List arr) {
    int n = arr.size()
    for (int i = n / 2 - 1; i >= 0; i--) heapify(arr, n, i)
    for (int i = n - 1; i > 0; i--) {
        def tmp = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        heapify(arr, i, 0)
    }
    return arr
}

println heapSort([9, 4, 7, 1, 3, 8, 2])
