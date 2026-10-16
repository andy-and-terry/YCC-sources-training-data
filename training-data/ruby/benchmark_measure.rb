require "benchmark"

n = 50_000
r = Benchmark.realtime { n.times { |i| i * i } }
puts r.class, r >= 0

res = Benchmark.measure { (1..n).map { |x| x + 1 } }
puts res.real >= 0, res.class

Benchmark.bm(8) do |x|
  x.report("map:")    { (1..n).map { |i| i * 2 } }
  x.report("each:")   { a = []; (1..n).each { |i| a << i * 2 } }
  x.report("lazy:")   { (1..Float::INFINITY).lazy.map { |i| i * 2 }.first(n) }
end

puts Process.clock_gettime(Process::CLOCK_MONOTONIC).class
