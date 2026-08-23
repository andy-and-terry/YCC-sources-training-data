def kadane(items) {
    int best = items[0]
    int current = items[0]
    for (int i = 1; i < items.size(); i++) {
        current = Math.max(items[i], current + items[i])
        best = Math.max(best, current)
    }
    return best
}

println kadane([-2, 1, -3, 4, -1, 2, 1, -5, 4])
