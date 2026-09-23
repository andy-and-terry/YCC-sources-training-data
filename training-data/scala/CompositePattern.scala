trait FileSystemNode {
  def totalSize: Int
  def describe(indent: String): Unit
}

class FileLeaf(name: String, size: Int) extends FileSystemNode {
  def totalSize: Int = size
  def describe(indent: String): Unit = println(s"$indent$name ($size KB)")
}

class Directory(name: String) extends FileSystemNode {
  private var children: List[FileSystemNode] = Nil

  def add(child: FileSystemNode): Directory = {
    children = children :+ child
    this
  }

  def totalSize: Int = children.map(_.totalSize).sum

  def describe(indent: String): Unit = {
    println(s"$indent$name/")
    children.foreach(_.describe(indent + "  "))
  }
}

object CompositePatternDemo {
  def main(args: Array[String]): Unit = {
    val root = new Directory("root")
    root.add(new FileLeaf("a.txt", 10))

    val sub = new Directory("sub")
    sub.add(new FileLeaf("b.txt", 20)).add(new FileLeaf("c.txt", 5))
    root.add(sub)

    root.describe("")
    println(s"total size: ${root.totalSize} KB")
  }
}
