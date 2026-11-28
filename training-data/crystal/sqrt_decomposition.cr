class SqrtSum
  def initialize(@a : Array(Int32), @bs : Int32)
    @blk = @a.each_slice(@bs).map(&.sum).to_a
  end

  def query(l : Int32, r : Int32) : Int32
    s = 0
    i = l
    while i <= r
      if i % @bs == 0 && i + @bs - 1 <= r
        s += @blk[i // @bs]
        i += @bs
      else
        s += @a[i]
        i += 1
      end
    end
    s
  end
end

puts SqrtSum.new([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4).query(2, 9)
