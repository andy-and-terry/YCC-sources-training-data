# By default a Hash compares keys by value (==, hash).
# compare_by_identity switches to object identity (same object).
a = "key"
b = "key"

normal = {} of String => Int32
normal[a] = 1
normal[b] = 2
puts normal.size
puts normal.inspect

identity = {} of String => Int32
identity.compare_by_identity
identity[a] = 1
identity[b] = 2
puts identity.size
puts identity.compare_by_identity?

puts identity[a]
puts identity[b]
puts identity["key"]?.inspect

# Useful for tracking visited objects
class Node
  def initialize(@name : String)
  end
end

seen = {} of Node => Bool
seen.compare_by_identity
n1 = Node.new("x")
n2 = Node.new("x")
seen[n1] = true
puts seen.has_key?(n1)
puts seen.has_key?(n2)
