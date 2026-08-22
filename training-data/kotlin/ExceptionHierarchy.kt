open class ApiException(message: String) : Exception(message)
class NotFoundException(path: String) : ApiException("not found: $path")
class ValidationException(field: String) : ApiException("invalid field: $field")

fun handleRequest(path: String) {
    if (path == "/missing") throw NotFoundException(path)
    if (path == "/bad") throw ValidationException("name")
}

fun main() {
    for (path in listOf("/missing", "/bad", "/ok")) {
        try {
            handleRequest(path)
            println("$path: ok")
        } catch (e: ApiException) {
            println("$path: ${e.message}")
        }
    }
}
