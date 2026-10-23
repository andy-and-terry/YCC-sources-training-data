# Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
def zeckendorf(n : Int32) : Array(Int32)
  fibs = [1, 2]
  while fibs[-1] + fibs[-2] <= n
    fibs << fibs[-1] + fibs[-2]
  end

  rest = n
  parts = [] of Int32
  fibs.reverse_each do |f|
    if f <= rest
      parts << f
      rest -= f
    end
  end
  parts
end

puts zeckendorf(100).join(" ")
