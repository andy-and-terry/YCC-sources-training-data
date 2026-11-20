// Bead (gravity) sort.
def beadSort(List<Integer> nums) {
    def cols = (0..<nums.max()).collect { i -> nums.count { it > i } }
    (0..<nums.size()).collect { r -> cols.count { it > r } }.reverse()
}
println beadSort([5, 3, 1, 4, 2])
