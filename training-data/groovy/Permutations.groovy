List<List<Integer>> permute(List<Integer> nums) {
    if (nums.isEmpty()) return [[]]
    def result = []
    for (i in 0..<nums.size()) {
        def rest = new ArrayList(nums)
        def current = rest.remove(i)
        for (perm in permute(rest)) {
            result << ([current] + perm)
        }
    }
    result
}

def perms = permute([1, 2, 3])
perms.each { println it }
println "total permutations: ${perms.size()}"
