class SqrtSum
  def initialize(a, bs)
    @a, @bs = a, bs
    @blk = a.each_slice(bs).map(&:sum)
  end

  def query(l, r)
    s = 0
    i = l
    while i <= r
      if (i % @bs).zero? && i + @bs - 1 <= r
        s += @blk[i / @bs]
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
