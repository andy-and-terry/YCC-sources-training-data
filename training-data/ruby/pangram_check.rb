def pangram?(sentence)
  (("a".."z").to_a - sentence.downcase.chars).empty?
end

puts pangram?("The quick brown fox jumps over the lazy dog")
puts pangram?("Hello world")
