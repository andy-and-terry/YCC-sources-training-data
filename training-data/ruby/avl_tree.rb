class AVLNode
  attr_accessor :key, :height, :left, :right

  def initialize(key)
    @key = key
    @height = 1
    @left = nil
    @right = nil
  end
end

class AVLTree
  def height(node)
    node ? node.height : 0
  end

  def balance_factor(node)
    node ? height(node.left) - height(node.right) : 0
  end

  def update_height(node)
    node.height = 1 + [height(node.left), height(node.right)].max
  end

  def rotate_right(y)
    x = y.left
    y.left = x.right
    x.right = y
    update_height(y)
    update_height(x)
    x
  end

  def rotate_left(x)
    y = x.right
    x.right = y.left
    y.left = x
    update_height(x)
    update_height(y)
    y
  end

  def insert(node, key)
    return AVLNode.new(key) if node.nil?

    if key < node.key
      node.left = insert(node.left, key)
    elsif key > node.key
      node.right = insert(node.right, key)
    else
      return node
    end

    update_height(node)
    balance = balance_factor(node)

    return rotate_right(node) if balance > 1 && key < node.left.key
    return rotate_left(node) if balance < -1 && key > node.right.key

    if balance > 1 && key > node.left.key
      node.left = rotate_left(node.left)
      return rotate_right(node)
    end

    if balance < -1 && key < node.right.key
      node.right = rotate_right(node.right)
      return rotate_left(node)
    end

    node
  end

  def inorder(node, result = [])
    return result if node.nil?

    inorder(node.left, result)
    result << node.key
    inorder(node.right, result)
    result
  end
end

tree = AVLTree.new
root = nil
[10, 20, 30, 40, 50, 25].each { |value| root = tree.insert(root, value) }
puts tree.inorder(root).inspect
puts "height=#{tree.height(root)} root=#{root.key}"
