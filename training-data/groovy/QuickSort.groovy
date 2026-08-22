def quicksort(items) {
    if (items.size() <= 1) return items
    def pivot = items[items.size() / 2 as int]
    def left = items.findAll { it < pivot }
    def mid = items.findAll { it == pivot }
    def right = items.findAll { it > pivot }
    return quicksort(left) + mid + quicksort(right)
}

println quicksort([5, 3, 8, 1, 9, 2])
