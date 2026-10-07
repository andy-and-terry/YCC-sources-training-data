List<List<Integer>> powerSet(List<Integer> nums) {
    def result = [[]]
    nums.each { num ->
        def newSubsets = result.collect { it + num }
        result += newSubsets
    }
    result
}

def subsets = powerSet([1, 2, 3])
subsets.each { println it }
println "total subsets: ${subsets.size()}"
