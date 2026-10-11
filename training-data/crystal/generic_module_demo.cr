module Container(T)
  abstract def items : Array(T)

  def first_item : T?
    items.first?
  end

  def count_where(&block : T -> Bool) : Int32
    items.count { |i| yield i }
  end
end

class Shelf
  include Container(String)

  def initialize(@books : Array(String))
  end

  def items : Array(String)
    @books
  end
end

s = Shelf.new(["Dune", "Emma", "Ulysses"])
puts s.first_item
puts s.count_where { |b| b.size == 4 }
puts Shelf.new([] of String).first_item.inspect
