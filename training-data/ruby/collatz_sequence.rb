def collatz(n)
  return to_enum(:collatz, n) unless block_given?

  loop do
    yield n
    break if n == 1

    n = n.even? ? n / 2 : 3 * n + 1
  end
end

seq = collatz(27).to_a
puts "#{seq.first(10).inspect}... length #{seq.size}"

cache = { 1 => 0 }
steps = lambda do |n|
  path = []
  until cache.key?(n)
    path << n
    n = n.even? ? n / 2 : 3 * n + 1
  end
  s = cache[n]
  path.reverse_each { |x| cache[x] = (s += 1) }
  cache[path.first || n]
end
best = (1...100_000).max_by { |i| steps.call(i) }
puts "longest under 100000: #{best} (#{cache[best]} steps)"
