case class Request(method: String, path: List[String], body: Option[String])
case class Response(status: Int, body: String)

object RequestRoutingPatternMatch {
  def route(request: Request): Response = request match {
    case Request("GET", "users" :: Nil, _) =>
      Response(200, "list of users")

    case Request("GET", "users" :: id :: Nil, _) if id.forall(_.isDigit) =>
      Response(200, s"user $id")

    case Request("POST", "users" :: Nil, Some(body)) if body.nonEmpty =>
      Response(201, s"created user with $body")

    case Request("POST", "users" :: Nil, None) =>
      Response(400, "missing request body")

    case r @ Request(_, "admin" :: _, _) =>
      Response(403, s"forbidden: ${r.method} ${r.path.mkString("/")}")

    case Request(method, path, _) =>
      Response(404, s"no route for $method /${path.mkString("/")}")
  }

  def main(args: Array[String]): Unit = {
    val requests = List(
      Request("GET", List("users"), None),
      Request("GET", List("users", "42"), None),
      Request("POST", List("users"), Some("""{"name":"Ada"}""")),
      Request("POST", List("users"), None),
      Request("GET", List("admin", "settings"), None),
      Request("DELETE", List("users", "1"), None)
    )
    requests.foreach(r => println(route(r)))
  }
}
