class Box { var w = 0; var h = 0 }

fun main() {
    val b = Box().apply { w = 3; h = 4 }
    val area = b.let { it.w * it.h }
    b.also { println("box ${it.w}x${it.h}") }
    println(area)
    println(with(b) { w + h })
}
