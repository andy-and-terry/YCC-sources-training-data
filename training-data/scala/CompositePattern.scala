sealed trait FileSystemNode {
  def totalSize: Int
  def print(depth: Int): Unit
}

case class FileNode(name: String, size: Int) extends FileSystemNode {
  def totalSize: Int = size
  def print(depth: Int): Unit = println("  " * depth + s"$name ($size bytes)")
}

case class DirNode(name: String, children: List[FileSystemNode]) extends FileSystemNode {
  def totalSize: Int = children.map(_.totalSize).sum
  def print(depth: Int): Unit = {
    println("  " * depth + s"$name/")
    children.foreach(_.print(depth + 1))
  }
}

object CompositePattern {
  def main(args: Array[String]): Unit = {
    val tree = DirNode("root", List(
      FileNode("a.txt", 100),
      DirNode("src", List(FileNode("Main.scala", 250), FileNode("Lib.scala", 400)))
    ))

    tree.print(0)
    println(s"total size: ${tree.totalSize}")
  }
}
