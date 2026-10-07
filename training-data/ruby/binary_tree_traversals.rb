Node = Struct.new(:value, :left, :right)

def insert(node, v)
  return Node.new(v) unless node
  v < node.value ? node.left = insert(node.left, v) : node.right = insert(node.right, v)
  node
end

def inorder(n, &blk)
  return unless n
  inorder(n.left, &blk)
  blk.call(n.value)
  inorder(n.right, &blk)
end

def level_order(root)
  queue = [root]
  levels = []
  until queue.empty?
    levels << queue.map(&:value)
    queue = queue.flat_map { |n| [n.left, n.right] }.compact
  end
  levels
end

def height(n) = n ? 1 + [height(n.left), height(n.right)].max : 0

root = [8, 3, 10, 1, 6, 14, 4].reduce(nil) { |t, v| insert(t, v) }
out = []
inorder(root) { |v| out << v }
p out
p level_order(root)
puts height(root)
