interface Printer { fun print(msg: String) }
class ConsolePrinter : Printer { override fun print(msg: String) = println(msg) }
class Logger(p: Printer) : Printer by p

val expensive: Int by lazy { println("computing"); 42 }

fun main() {
    Logger(ConsolePrinter()).print("delegated")
    println(expensive)
    println(expensive)
}
