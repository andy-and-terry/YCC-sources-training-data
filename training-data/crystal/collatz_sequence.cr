# Collatz sequence: generate the hailstone path and find the longest start under a limit.

def collatz(n : Int64) : Array(Int64)
  path = [n]
  while n != 1
    n = n.even? ? n // 2 : 3 * n + 1
    path << n
  end
  path
end

def steps(n : Int64, cache : Hash(Int64, Int32)) : Int32
  return 0 if n == 1
  cache[n] ||= 1 + steps(n.even? ? n // 2 : 3 * n + 1, cache)
end

puts "27 -> #{collatz(27_i64).first(8).join(", ")} ... (#{collatz(27_i64).size - 1} steps)"

cache = {} of Int64 => Int32
best = (1_i64...10_000_i64).max_by { |i| steps(i, cache) }
puts "Longest chain under 10000 starts at #{best} with #{steps(best, cache)} steps"
