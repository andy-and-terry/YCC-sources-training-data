class Binomial
  def initialize(n, mod)
    @mod = mod
    @fact = [1]
    (1..n).each { |i| @fact << @fact[-1] * i % mod }
    @inv = Array.new(n + 1)
    @inv[n] = @fact[n].pow(mod - 2, mod)
    n.downto(1) { |i| @inv[i - 1] = @inv[i] * i % mod }
  end

  def [](n, k)
    return 0 if k.negative? || k > n

    @fact[n] * @inv[k] % @mod * @inv[n - k] % @mod
  end
end

def choose(n, k) = (1..[k, n - k].min).reduce(1) { |acc, i| acc * (n - [k, n - k].min + i) / i }

puts choose(10, 3), choose(52, 5), choose(100, 50)
b = Binomial.new(100_000, 1_000_000_007)
puts b[1000, 500], choose(1000, 500) % 1_000_000_007
