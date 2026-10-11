object SelfTypeAnnotation {
  trait Logger { def log(m: String): Unit = println("[log] " + m) }

  trait Service { self: Logger =>
    def run(job: String): Unit = {
      log(s"starting $job")
      println(s"running $job")
      log(s"finished $job")
    }
  }

  class App extends Service with Logger

  trait Named { def name: String }
  trait Greeting { this: Named =>
    def hello: String = s"Hello from $name"
  }
  class Bot extends Greeting with Named { val name = "bot-9" }

  def main(args: Array[String]): Unit = {
    new App().run("backup")
    println(new Bot().hello)
  }
}
