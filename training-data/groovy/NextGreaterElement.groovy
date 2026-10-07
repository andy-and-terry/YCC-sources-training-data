List<Integer> nextGreaterElements(List<Integer> nums) {
    def n = nums.size()
    def result = new int[n]
    Arrays.fill(result, -1)
    def stack = []
    for (i in 0..<n) {
        while (!stack.isEmpty() && nums[stack[-1]] < nums[i]) {
            def idx = stack.pop()
            result[idx] = nums[i]
        }
        stack.push(i)
    }
    result as List<Integer>
}

def nums = [4, 5, 2, 25, 7, 8]
println "next greater elements: ${nextGreaterElements(nums)}"
