class TreeNode
  property value : Int32
  property left : TreeNode?
  property right : TreeNode?

  def initialize(@value : Int32)
  end
end

def insert(node : TreeNode?, value : Int32) : TreeNode
  return TreeNode.new(value) if node.nil?
  if value < node.value
    node.left = insert(node.left, value)
  else
    node.right = insert(node.right, value)
  end
  node
end

def inorder(node : TreeNode?, result : Array(Int32))
  return if node.nil?
  inorder(node.left, result)
  result << node.value
  inorder(node.right, result)
end

root = nil
[5, 3, 8, 1, 4, 7, 9].each { |v| root = insert(root, v) }
result = [] of Int32
inorder(root, result)
puts result.inspect
