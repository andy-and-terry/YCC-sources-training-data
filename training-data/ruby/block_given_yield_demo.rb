def greet(name)
  return "Hi #{name}" unless block_given?
  yield(name)
end

puts greet("Ann")
puts greet("Ann") { |n| "Yo #{n.upcase}" }

def twice
  return to_enum(:twice) unless block_given?
  yield 1
  yield 2
end
puts twice.to_a.inspect

def with_timing
  start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  result = yield
  elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start
  [result, elapsed >= 0]
end
puts with_timing { 6 * 7 }.inspect

def pass_along(&blk) = [1, 2, 3].map(&blk)
puts pass_along { |x| x + 10 }.inspect

def arity_check = yield(1, 2, 3)
puts arity_check { |a, b| "#{a},#{b}" }
puts arity_check { |a, *rest| "#{a} #{rest}" }
