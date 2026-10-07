class TreeNode
  property value : Int32
  property left : TreeNode?
  property right : TreeNode?

  def initialize(@value : Int32)
  end
end

def diameter(root : TreeNode?) : Int32
  max_diameter = 0

  height = uninitialized Proc(TreeNode?, Int32)
  height = ->(node : TreeNode?) do
    next 0 unless node
    left_height = height.call(node.left)
    right_height = height.call(node.right)
    max_diameter = Math.max(max_diameter, left_height + right_height)
    Math.max(left_height, right_height) + 1
  end

  height.call(root)
  max_diameter
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.left.not_nil!.left = TreeNode.new(4)
root.left.not_nil!.right = TreeNode.new(5)

puts diameter(root)
