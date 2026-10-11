fun searchRotated(a: IntArray, target: Int): Int {
    var lo = 0
    var hi = a.lastIndex
    while (lo <= hi) {
        val mid = (lo + hi) ushr 1
        if (a[mid] == target) return mid
        if (a[lo] <= a[mid]) {
            if (target >= a[lo] && target < a[mid]) hi = mid - 1 else lo = mid + 1
        } else {
            if (target > a[mid] && target <= a[hi]) lo = mid + 1 else hi = mid - 1
        }
    }
    return -1
}

fun main() {
    val a = intArrayOf(4, 5, 6, 7, 0, 1, 2)
    println(searchRotated(a, 0))
    println(searchRotated(a, 6))
    println(searchRotated(a, 3))
}
