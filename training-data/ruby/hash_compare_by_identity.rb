# compare_by_identity makes a Hash use object identity (equal?) for keys
# instead of eql?/hash.
normal = {}
k1 = "key"
k2 = "key"
normal[k1] = 1
normal[k2] = 2
puts normal.size          # => 1 (equal strings collapse)

by_id = {}.compare_by_identity
by_id[k1] = 1
by_id[k2] = 2
puts by_id.size           # => 2 (distinct objects)
puts by_id[k1]            # => 1
puts by_id["key"].inspect # => nil, a new literal is a different object
puts by_id.compare_by_identity? # => true

# Symbols and small integers are the same object, so they still match.
by_id[:a] = :x
puts by_id[:a]
