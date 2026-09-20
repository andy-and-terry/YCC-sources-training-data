def partition(List<Integer> nums, int low, int high) {
    int pivot = nums[high]
    int i = low
    for (j in low..<high) {
        if (nums[j] <= pivot) {
            def tmp = nums[i]
            nums[i] = nums[j]
            nums[j] = tmp
            i++
        }
    }
    def tmp = nums[i]
    nums[i] = nums[high]
    nums[high] = tmp
    return i
}

def quickSelect(List<Integer> nums, int k) {
    int low = 0
    int high = nums.size() - 1
    while (true) {
        int pivotIndex = partition(nums, low, high)
        if (pivotIndex == k) {
            return nums[pivotIndex]
        } else if (pivotIndex < k) {
            low = pivotIndex + 1
        } else {
            high = pivotIndex - 1
        }
    }
}

def nums = [7, 10, 4, 3, 20, 15]
int k = 2
println "the ${k}th smallest element is ${quickSelect(nums, k)}"
