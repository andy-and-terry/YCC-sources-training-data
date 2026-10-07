original = 'hello'.freeze

duped = original.dup
cloned = original.clone

puts "original frozen? #{original.frozen?}"
puts "dup frozen?       #{duped.frozen?}"   # dup does NOT carry the frozen state
puts "clone frozen?     #{cloned.frozen?}"  # clone DOES carry the frozen state

duped << ' world'
puts duped

begin
  cloned << ' world'
rescue FrozenError => e
  puts "clone raised: #{e.class}"
end

# Both dup and clone are shallow: nested mutable objects are shared.
original_array = [[1, 2], [3, 4]].freeze
shallow_copy = original_array.dup
shallow_copy[0] << 99
puts "mutating the copy's nested array also changed the original: #{original_array.inspect}"
