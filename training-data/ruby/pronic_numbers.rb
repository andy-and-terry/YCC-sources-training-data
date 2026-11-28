def pronic?(x)
  n = Integer.sqrt(x)
  n * (n + 1) == x
end

p (0...10).map { |n| n * (n + 1) } # [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
p [pronic?(56), pronic?(57)]       # [true, false]
