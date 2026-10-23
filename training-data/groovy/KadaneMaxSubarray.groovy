def maxSubarray(List<Integer> a) {
    int best = a[0], cur = a[0]
    a.tail().each { x ->
        cur = Math.max(x, cur + x)
        best = Math.max(best, cur)
    }
    best
}

println maxSubarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
println maxSubarray([-3, -1, -2])
assert maxSubarray([1, 2, 3]) == 6
