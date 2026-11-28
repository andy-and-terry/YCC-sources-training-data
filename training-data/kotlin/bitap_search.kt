fun bitap(text: String, pat: String): Int {
    val masks = LongArray(65536)
    pat.forEachIndexed { i, c -> masks[c.code] = masks[c.code] or (1L shl i) }
    val goal = 1L shl (pat.length - 1)
    var state = 0L
    text.forEachIndexed { i, c ->
        state = ((state shl 1) or 1L) and masks[c.code]
        if (state and goal != 0L) return i - pat.length + 1
    }
    return -1
}

fun main() = println(bitap("the quick brown fox", "brown"))
