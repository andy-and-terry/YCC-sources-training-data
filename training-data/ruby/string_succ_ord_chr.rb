# String#succ, ord and Integer#chr: character arithmetic.
puts "az".succ        # => "ba"
puts "zz".succ        # => "aaa"
puts "a9".succ        # => "b0"
puts "Zz".succ        # => "AAa"

puts "A".ord          # => 65
puts 97.chr           # => "a"
puts 8364.chr(Encoding::UTF_8)

# Shift each letter by 3 (a simple Caesar cipher using ord/chr).
shifted = "hello".each_char.map { |c| ((c.ord - 97 + 3) % 26 + 97).chr }.join
puts shifted

# succ drives string ranges.
puts ("aa".."ad").to_a.inspect
puts ("a".."e").step(2).to_a.inspect
