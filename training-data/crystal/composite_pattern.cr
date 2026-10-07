abstract class FileSystemNode
  abstract def size : Int32
end

class FileNode < FileSystemNode
  def initialize(@name : String, @bytes : Int32)
  end

  def size : Int32
    @bytes
  end
end

class DirectoryNode < FileSystemNode
  def initialize(@name : String)
    @children = [] of FileSystemNode
  end

  def add(node : FileSystemNode)
    @children << node
  end

  def size : Int32
    @children.sum(&.size)
  end
end

root = DirectoryNode.new("root")
root.add(FileNode.new("a.txt", 100))
sub = DirectoryNode.new("sub")
sub.add(FileNode.new("b.txt", 200))
root.add(sub)
puts root.size
