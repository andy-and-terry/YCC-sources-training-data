class TreeNode
  property value : Int32
  property left : TreeNode?
  property right : TreeNode?

  def initialize(@value : Int32)
  end
end

def invert(node : TreeNode?) : TreeNode?
  return nil unless node
  node.left, node.right = invert(node.right), invert(node.left)
  node
end

def inorder(node : TreeNode?, result : Array(Int32))
  return unless node
  inorder(node.left, result)
  result << node.value
  inorder(node.right, result)
end

root = TreeNode.new(4)
root.left = TreeNode.new(2)
root.right = TreeNode.new(7)
root.left.not_nil!.left = TreeNode.new(1)
root.left.not_nil!.right = TreeNode.new(3)

invert(root)
result = [] of Int32
inorder(root, result)
puts result.inspect
