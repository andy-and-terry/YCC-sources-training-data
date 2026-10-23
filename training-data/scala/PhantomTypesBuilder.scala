object PhantomTypesBuilder {
  sealed trait State
  sealed trait Empty extends State
  sealed trait HasHost extends State
  sealed trait Ready extends State

  final case class Request[S <: State](host: String, port: Int, path: String) {
    def withHost(h: String)(implicit ev: S =:= Empty): Request[HasHost] =
      Request[HasHost](h, port, path)

    def withPath(p: String)(implicit ev: S =:= HasHost): Request[Ready] =
      Request[Ready](host, port, p)
  }

  object Request {
    def apply(): Request[Empty] = new Request[Empty]("", 80, "/")
  }

  def send(r: Request[Ready]): String = s"GET http://${r.host}:${r.port}${r.path}"

  def main(args: Array[String]): Unit = {
    val r = Request().withHost("example.com").withPath("/index")
    println(send(r))
    // send(Request().withHost("example.com")) does not compile: not Ready
    // Request().withPath("/x") does not compile: no host yet
  }
}
