fib = Hash.new { |h, n| h[n] = n < 2 ? n : h[n - 1] + h[n - 2] }
puts fib[90]

class Module
  def memoize(name)
    orig = instance_method(name)
    cache = {}
    define_method(name) { |*a| cache.fetch(a) { cache[a] = orig.bind(self).call(*a) } }
  end
end

class M
  def slow(n) = (puts "computing"; n * n)
  memoize :slow
end
m = M.new
puts m.slow(4), m.slow(4)
