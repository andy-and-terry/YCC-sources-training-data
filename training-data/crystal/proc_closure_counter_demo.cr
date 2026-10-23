# Procs capture variables from the surrounding scope (closures).
def make_counter(start : Int32) : Proc(Int32)
  count = start
  -> { count += 1 }
end

a = make_counter(0)
b = make_counter(100)
puts a.call
puts a.call
puts b.call
puts a.call

# Proc with arguments and explicit types
adder = ->(x : Int32, y : Int32) { x + y }
puts adder.call(3, 4)

# Capturing a mutable variable shares it
total = 0
add_to_total = ->(n : Int32) { total += n }
[1, 2, 3].each { |n| add_to_total.call(n) }
puts total

# Procs can be stored and composed
double = ->(x : Int32) { x * 2 }
inc = ->(x : Int32) { x + 1 }
pipeline = [double, inc, double]
puts pipeline.reduce(5) { |acc, f| f.call(acc) }

# A proc can be passed where a block is expected
puts [1, 2, 3].map(&double).inspect
