fun lucky(limit: Int): List<Int> {
    var nums = (1..limit step 2).toList()
    var i = 1
    while (i < nums.size && nums[i] <= nums.size) {
        val step = nums[i]
        nums = nums.filterIndexed { idx, _ -> (idx + 1) % step != 0 }
        i++
    }
    return nums
}

fun main() {
    println(lucky(50).joinToString(" "))
}
