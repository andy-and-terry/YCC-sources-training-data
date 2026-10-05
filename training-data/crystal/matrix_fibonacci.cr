alias Mat = Array(Array(UInt64))

def multiply(a : Mat, b : Mat) : Mat
  result = Mat.new(2) { Array(UInt64).new(2, 0_u64) }
  2.times do |i|
    2.times do |j|
      2.times { |k| result[i][j] += a[i][k] * b[k][j] }
    end
  end
  result
end

def fib(n : Int32) : UInt64
  result = [[1_u64, 0_u64], [0_u64, 1_u64]]
  base = [[1_u64, 1_u64], [1_u64, 0_u64]]
  while n > 0
    result = multiply(result, base) if n.odd?
    base = multiply(base, base)
    n >>= 1
  end
  result[0][1]
end

[1, 10, 50, 90].each { |n| puts "fib(#{n}) = #{fib(n)}" }
