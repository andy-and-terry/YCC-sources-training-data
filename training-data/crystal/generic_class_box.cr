class Box(T)
  def initialize(@v : T); end
  def map(&block : T -> U) forall U
    Box(U).new(yield @v)
  end
  def value; @v; end
end
puts Box.new(3).map { |x| x.to_s * 2 }.value
