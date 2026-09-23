class TreeType
  attr_reader :name, :color, :texture

  def initialize(name, color, texture)
    @name = name
    @color = color
    @texture = texture
  end

  def draw(x, y)
    puts "drawing #{color} #{name} (#{texture}) at (#{x}, #{y})"
  end
end

class TreeFactory
  @tree_types = {}

  def self.tree_type(name, color, texture)
    key = [name, color, texture]
    @tree_types[key] ||= TreeType.new(name, color, texture)
  end

  def self.type_count
    @tree_types.size
  end
end

class Tree
  def initialize(x, y, tree_type)
    @x = x
    @y = y
    @tree_type = tree_type
  end

  def draw
    @tree_type.draw(@x, @y)
  end
end

trees = []
[[1, 2], [3, 4], [5, 6]].each do |x, y|
  trees << Tree.new(x, y, TreeFactory.tree_type('Oak', 'green', 'rough'))
end
trees << Tree.new(7, 8, TreeFactory.tree_type('Pine', 'dark green', 'needled'))

trees.each(&:draw)
puts "distinct flyweights created: #{TreeFactory.type_count}"
