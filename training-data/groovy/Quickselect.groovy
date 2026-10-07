int partition(List<Integer> nums, int low, int high) {
    int pivot = nums[high]
    int i = low
    for (j in low..<high) {
        if (nums[j] < pivot) {
            def tmp = nums[i]; nums[i] = nums[j]; nums[j] = tmp
            i++
        }
    }
    def tmp = nums[i]; nums[i] = nums[high]; nums[high] = tmp
    i
}

int quickselect(List<Integer> nums, int k) {
    int low = 0, high = nums.size() - 1
    while (true) {
        int p = partition(nums, low, high)
        if (p == k) return nums[p]
        else if (p < k) low = p + 1
        else high = p - 1
    }
}

def nums = [7, 10, 4, 3, 20, 15]
println "3rd smallest: ${quickselect(nums, 2)}"
