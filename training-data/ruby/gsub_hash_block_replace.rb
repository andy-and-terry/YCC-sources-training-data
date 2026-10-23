# String#gsub accepts a string, a hash, or a block as the replacement.
text = "cat bat rat"

puts text.gsub("at", "og")
puts text.gsub(/[cb]at/, "cat" => "dog", "bat" => "owl")   # hash lookup
puts text.gsub(/\w+/) { |w| w.capitalize }
puts text.gsub(/(\w)at/, '\1ot')                            # backreference
puts text.gsub(/(?<first>\w)at/, '\k<first>ut')             # named group

# $~ and $1 are available inside the block.
puts "2024-05-06".gsub(/(\d+)-(\d+)-(\d+)/) { "#{$3}/#{$2}/#{$1}" }

# Without a replacement gsub returns an enumerator of matches.
p "a1b22c333".gsub(/\d+/).to_a

# gsub! returns nil when nothing changed.
s = +"hello"
p s.gsub!("z", "y")
p s.gsub!("l", "L"), s

# tr and delete for character-level work
puts "hello".tr("el", "ip")
puts "hello world".delete("lo")
puts "aaabbb".squeeze
puts "snake_case_word".split("_").map.with_index { |w, i| i.zero? ? w : w.capitalize }.join
