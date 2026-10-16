import java.util.TreeMap
import java.util.TreeSet

fun main() {
    val grades = TreeMap<Int, String>()
    grades[0] = "F"; grades[60] = "D"; grades[70] = "C"; grades[80] = "B"; grades[90] = "A"

    for (s in listOf(95, 85, 72, 61, 15)) {
        println("$s -> ${grades.floorEntry(s).value}")
    }
    println(grades.headMap(70))
    println(grades.firstKey())
    println(grades.ceilingKey(65))

    val set = TreeSet(listOf(5, 1, 9, 3))
    println(set.first())
    println(set.higher(5))
    println(set.descendingSet())

    println(sortedMapOf("b" to 2, "a" to 1))
}
