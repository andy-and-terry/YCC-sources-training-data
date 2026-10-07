class Pair(A, B)
  getter first : A
  getter second : B

  def initialize(@first : A, @second : B)
  end

  def swap : Pair(B, A)
    Pair(B, A).new(@second, @first)
  end

  def to_s(io : IO) : Nil
    io << "(" << @first << ", " << @second << ")"
  end
end

pair = Pair.new(1, "one")
puts pair
puts pair.swap
puts pair.swap.first.class
puts Pair.new(:a, 2.5)
