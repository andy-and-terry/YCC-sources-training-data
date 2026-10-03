List<List<Integer>> threeSum(List<Integer> nums) {
    def sorted = nums.sort(false)
    def result = []
    def n = sorted.size()
    for (i in 0..<n - 2) {
        if (i > 0 && sorted[i] == sorted[i - 1]) continue
        int left = i + 1, right = n - 1
        while (left < right) {
            int sum = sorted[i] + sorted[left] + sorted[right]
            if (sum < 0) {
                left++
            } else if (sum > 0) {
                right--
            } else {
                result << [sorted[i], sorted[left], sorted[right]]
                while (left < right && sorted[left] == sorted[left + 1]) left++
                while (left < right && sorted[right] == sorted[right - 1]) right--
                left++
                right--
            }
        }
    }
    result
}

println threeSum([-1, 0, 1, 2, -1, -4])
