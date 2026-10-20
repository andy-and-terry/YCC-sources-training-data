class Tree
  include Enumerable
  def initialize = @items = []
  def <<(x) = (@items << x; self)
  def each(&blk)
    return enum_for(:each) unless blk
    @items.sort.each(&blk)
  end
end

t = Tree.new << 5 << 1 << 3
puts t.map { |x| x * 2 }.inspect, t.min, t.each_slice(2).to_a.inspect, t.include?(3), t.first(2).inspect
