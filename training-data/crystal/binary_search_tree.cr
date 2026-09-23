class BSTNode(T)
  property value : T
  property left : BSTNode(T)?
  property right : BSTNode(T)?

  def initialize(@value : T)
  end
end

class BinarySearchTree(T)
  def initialize
    @root = nil.as(BSTNode(T)?)
  end

  def insert(value : T)
    @root = insert_at(@root, value)
  end

  private def insert_at(node : BSTNode(T)?, value : T) : BSTNode(T)
    return BSTNode(T).new(value) if node.nil?
    if value < node.value
      node.left = insert_at(node.left, value)
    elsif value > node.value
      node.right = insert_at(node.right, value)
    end
    node
  end

  def contains?(value : T) : Bool
    node = @root
    while node
      return true if node.value == value
      node = value < node.value ? node.left : node.right
    end
    false
  end

  def inorder : Array(T)
    result = [] of T
    traverse(@root, result)
    result
  end

  private def traverse(node : BSTNode(T)?, result : Array(T))
    return if node.nil?
    traverse(node.left, result)
    result << node.value
    traverse(node.right, result)
  end
end

tree = BinarySearchTree(String).new
["mango", "apple", "cherry", "banana"].each { |word| tree.insert(word) }
puts tree.inorder.inspect
puts tree.contains?("cherry")
puts tree.contains?("kiwi")
