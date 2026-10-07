class FileSystemNode
  def size
    raise NotImplementedError
  end

  def display(indent = 0)
    raise NotImplementedError
  end
end

class FileLeaf < FileSystemNode
  def initialize(name, size_bytes)
    @name = name
    @size_bytes = size_bytes
  end

  def size
    @size_bytes
  end

  def display(indent = 0)
    puts "#{' ' * indent}#{@name} (#{@size_bytes}b)"
  end
end

class Directory < FileSystemNode
  def initialize(name)
    @name = name
    @children = []
  end

  def add(node)
    @children << node
    self
  end

  def size
    @children.sum(&:size)
  end

  def display(indent = 0)
    puts "#{' ' * indent}#{@name}/ (#{size}b)"
    @children.each { |child| child.display(indent + 2) }
  end
end

root = Directory.new("root")
src = Directory.new("src")
src.add(FileLeaf.new("main.rb", 120)).add(FileLeaf.new("utils.rb", 340))
root.add(src).add(FileLeaf.new("README.md", 50))

root.display
puts "total size: #{root.size}"
