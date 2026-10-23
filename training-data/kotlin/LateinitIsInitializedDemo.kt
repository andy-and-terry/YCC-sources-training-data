// lateinit defers initialization; ::prop.isInitialized checks it safely.

class Session {
    lateinit var token: String
    var attempts = 0

    fun login(user: String) {
        attempts++
        token = "tok-" + user.lowercase()
    }

    fun describe(): String =
        if (this::token.isInitialized) "token=$token" else "not logged in"

    fun requireToken(): String {
        check(this::token.isInitialized) { "login first" }
        return token
    }
}

fun main() {
    val s = Session()
    println(s.describe())

    try {
        s.requireToken()
    } catch (e: IllegalStateException) {
        println("error: ${e.message}")
    }

    // Accessing it before assignment throws UninitializedPropertyAccessException
    try {
        println(s.token)
    } catch (e: UninitializedPropertyAccessException) {
        println("uninitialized")
    }

    s.login("Alice")
    println(s.describe())
    println(s.requireToken().length)
    println("attempts=${s.attempts}")
}
