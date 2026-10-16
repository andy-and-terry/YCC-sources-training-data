fun main() {
    val text = "Hello, World 42!"
    println(text.count { it.isLetter() })
    println(text.count { it.isDigit() })
    println(text.filter { it.isUpperCase() })
    println(text.count { it.isWhitespace() })

    println('a'.code)
    println(97.toChar())
    println('a' + 2)
    println('z' - 'a')
    println('7'.digitToInt() + 1)
    println(11.digitToChar(16))
    println('ß'.uppercaseChar())
    println(('a'..'e').joinToString(""))
}
