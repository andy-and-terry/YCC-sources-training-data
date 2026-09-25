require 'matrix'

MOD = 1_000_000_007

def mat_mul(a, b)
  [[(a[0][0] * b[0][0] + a[0][1] * b[1][0]) % MOD, (a[0][0] * b[0][1] + a[0][1] * b[1][1]) % MOD],
   [(a[1][0] * b[0][0] + a[1][1] * b[1][0]) % MOD, (a[1][0] * b[0][1] + a[1][1] * b[1][1]) % MOD]]
end

def fib_mod(n)
  result = [[1, 0], [0, 1]]
  base = [[1, 1], [1, 0]]
  while n.positive?
    result = mat_mul(result, base) if n.odd?
    base = mat_mul(base, base)
    n >>= 1
  end
  result[0][1]
end

p (0...15).map { |i| fib_mod(i) }
puts "fib(10^18) mod p = #{fib_mod(10**18)}"
# exact big value via stdlib Matrix
puts "fib(300) = #{(Matrix[[1, 1], [1, 0]]**300)[0, 1]}"
