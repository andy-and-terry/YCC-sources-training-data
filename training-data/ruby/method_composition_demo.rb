# Method objects, to_proc and function composition with >> and <<.
def double(x) = x * 2
def inc(x) = x + 1

m = method(:double)
p [1, 2, 3].map(&m)
p m.arity, m.name, m.owner

pipeline = method(:double) >> method(:inc) >> :to_s.to_proc
p pipeline.call(5)

reverse_pipeline = method(:double) << method(:inc)
p reverse_pipeline.call(5)

shout = :upcase.to_proc >> ->(s) { s + "!" }
p shout.call("hey")

um = Array.instance_method(:size)
p um.bind([1, 2, 3]).call

add = ->(a, b) { a + b }
add5 = add.curry[5]
p add5[10]
p %w[1 2 3].map(&:to_i).sum
p [[1, 2], [3, 4]].map { |a, b| a * b }
