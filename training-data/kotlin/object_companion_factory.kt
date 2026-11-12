class Conn private constructor(val url: String) {
    companion object {
        fun open(host: String) = Conn("tcp://$host")
        const val DEFAULT_PORT = 5432
    }
}
fun main() { println(Conn.open("db").url + ":" + Conn.DEFAULT_PORT) }
