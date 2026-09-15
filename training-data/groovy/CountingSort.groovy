def countingSort(List<Integer> arr) {
    if (arr.isEmpty()) return arr
    int maxVal = arr.max()
    int[] counts = new int[maxVal + 1]
    arr.each { counts[it]++ }
    def result = []
    counts.eachWithIndex { count, value ->
        count.times { result << value }
    }
    return result
}

println countingSort([4, 2, 2, 8, 3, 3, 1])
