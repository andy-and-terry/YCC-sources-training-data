class Bag
  include Enumerable
  def initialize(*x) = @x = x
  def each(&b) = @x.each(&b)
end
b = Bag.new(3, 1, 2)
p b.sort, b.min, b.include?(2), b.each_slice(2).to_a
