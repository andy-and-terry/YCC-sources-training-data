class AVLNode
  property value : Int32
  property left : AVLNode?
  property right : AVLNode?
  property height : Int32

  def initialize(@value : Int32)
    @height = 1
  end
end

def height(node : AVLNode?) : Int32
  node.nil? ? 0 : node.height
end

def balance_factor(node : AVLNode?) : Int32
  node.nil? ? 0 : height(node.left) - height(node.right)
end

def update_height(node : AVLNode)
  node.height = 1 + Math.max(height(node.left), height(node.right))
end

def rotate_right(y : AVLNode) : AVLNode
  x = y.left.not_nil!
  t2 = x.right

  x.right = y
  y.left = t2

  update_height(y)
  update_height(x)
  x
end

def rotate_left(x : AVLNode) : AVLNode
  y = x.right.not_nil!
  t2 = y.left

  y.left = x
  x.right = t2

  update_height(x)
  update_height(y)
  y
end

def insert(node : AVLNode?, value : Int32) : AVLNode
  return AVLNode.new(value) if node.nil?

  if value < node.value
    node.left = insert(node.left, value)
  elsif value > node.value
    node.right = insert(node.right, value)
  else
    return node
  end

  update_height(node)
  balance = balance_factor(node)

  if balance > 1 && value < node.left.not_nil!.value
    return rotate_right(node)
  end
  if balance < -1 && value > node.right.not_nil!.value
    return rotate_left(node)
  end
  if balance > 1 && value > node.left.not_nil!.value
    node.left = rotate_left(node.left.not_nil!)
    return rotate_right(node)
  end
  if balance < -1 && value < node.right.not_nil!.value
    node.right = rotate_right(node.right.not_nil!)
    return rotate_left(node)
  end

  node
end

def inorder(node : AVLNode?, result : Array(Int32))
  return if node.nil?
  inorder(node.left, result)
  result << node.value
  inorder(node.right, result)
end

root = nil
[10, 20, 30, 40, 50, 25].each { |v| root = insert(root, v) }
result = [] of Int32
inorder(root, result)
puts result.inspect
puts height(root)
