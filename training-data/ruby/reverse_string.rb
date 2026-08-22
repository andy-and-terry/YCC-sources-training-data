def reverse_string(s)
  s.reverse
end

def reverse_words(s)
  s.split.reverse.join(' ')
end

puts reverse_string('hello')
puts reverse_words('the quick brown fox')
