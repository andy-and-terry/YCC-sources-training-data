class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

class BinaryTree
  def insert(value)
    @root = insert_node(@root, value)
  end

  def in_order
    result = []
    in_order_visit(@root, result)
    result
  end

  private

  def insert_node(node, value)
    return Node.new(value) if node.nil?
    if value < node.value
      node.left = insert_node(node.left, value)
    else
      node.right = insert_node(node.right, value)
    end
    node
  end

  def in_order_visit(node, result)
    return if node.nil?
    in_order_visit(node.left, result)
    result << node.value
    in_order_visit(node.right, result)
  end
end

tree = BinaryTree.new
[5, 3, 8, 1, 4, 7, 9].each { |v| tree.insert(v) }
puts tree.in_order.inspect
