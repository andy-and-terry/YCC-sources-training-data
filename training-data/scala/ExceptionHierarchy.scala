class ApiException(message: String) extends Exception(message)
class NotFoundException(path: String) extends ApiException(s"not found: $path")
class ValidationException(field: String) extends ApiException(s"invalid field: $field")

object ExceptionHierarchyDemo {
  def handleRequest(path: String): Unit = {
    if (path == "/missing") throw new NotFoundException(path)
    if (path == "/bad") throw new ValidationException("name")
  }

  def main(args: Array[String]): Unit = {
    for (path <- List("/missing", "/bad", "/ok")) {
      try {
        handleRequest(path)
        println(s"$path: ok")
      } catch {
        case e: ApiException => println(s"$path: ${e.getMessage}")
      }
    }
  }
}
