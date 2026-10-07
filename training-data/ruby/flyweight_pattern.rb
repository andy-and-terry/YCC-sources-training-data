class TreeType
  attr_reader :name, :texture

  def initialize(name, texture)
    @name = name
    @texture = texture
  end

  def render(x, y)
    "#{name} (#{texture}) at (#{x}, #{y})"
  end
end

class TreeFactory
  @cache = {}

  class << self
    def get(name, texture)
      key = "#{name}:#{texture}"
      @cache[key] ||= TreeType.new(name, texture)
    end

    def cache_size
      @cache.size
    end
  end
end

placements = [["oak", "green", 1, 2], ["oak", "green", 5, 9], ["pine", "dark", 3, 3]]
placements.each do |kind, texture, x, y|
  tree_type = TreeFactory.get(kind, texture)
  puts tree_type.render(x, y)
end

puts "distinct flyweights cached: #{TreeFactory.cache_size}"
