object SelfTypesCakePattern {
  trait Repo { def find(id: Int): String }
  trait RepoComponent { val repo: Repo }
  trait Service { self: RepoComponent =>
    def describe(id: Int): String = s"found ${repo.find(id)}"
  }
  object App extends Service with RepoComponent {
    val repo: Repo = (id: Int) => s"item#$id"
  }

  def main(args: Array[String]): Unit = println(App.describe(7))
}
