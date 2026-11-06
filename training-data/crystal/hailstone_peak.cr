# Highest value reached by the Collatz (hailstone) sequence from n.
def peak(n : Int64) : Int64
  best = n
  until n == 1
    n = n.even? ? n // 2 : 3 * n + 1
    best = {best, n}.max
  end
  best
end

puts peak(27_i64)
