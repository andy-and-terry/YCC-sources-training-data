class TreeNode
  property value : Int32
  property left : TreeNode?
  property right : TreeNode?

  def initialize(@value : Int32)
  end
end

def lca(node : TreeNode?, p : Int32, q : Int32) : TreeNode?
  return nil unless node
  return node if node.value == p || node.value == q

  left = lca(node.left, p, q)
  right = lca(node.right, p, q)

  return node if left && right
  left || right
end

root = TreeNode.new(6)
root.left = TreeNode.new(2)
root.right = TreeNode.new(8)
root.left.not_nil!.left = TreeNode.new(0)
root.left.not_nil!.right = TreeNode.new(4)

result = lca(root, 0, 4)
puts result.try(&.value)
