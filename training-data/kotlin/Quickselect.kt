fun quickselect(input: IntArray, k: Int): Int {
    val arr = input.copyOf()

    fun swap(i: Int, j: Int) {
        val temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
    }

    fun partition(left: Int, right: Int, pivotIndex: Int): Int {
        val pivotValue = arr[pivotIndex]
        swap(pivotIndex, right)
        var storeIndex = left
        for (i in left until right) {
            if (arr[i] < pivotValue) {
                swap(i, storeIndex)
                storeIndex++
            }
        }
        swap(right, storeIndex)
        return storeIndex
    }

    fun select(left: Int, right: Int, k: Int): Int {
        if (left == right) return arr[left]
        val pivotIndex = left + (right - left) / 2
        val newPivotIndex = partition(left, right, pivotIndex)
        return when {
            k == newPivotIndex -> arr[k]
            k < newPivotIndex -> select(left, newPivotIndex - 1, k)
            else -> select(newPivotIndex + 1, right, k)
        }
    }

    return select(0, arr.size - 1, k)
}

fun main() {
    println(quickselect(intArrayOf(7, 10, 4, 3, 20, 15), 2))
    println(quickselect(intArrayOf(1, 2, 3, 4, 5), 0))
}
