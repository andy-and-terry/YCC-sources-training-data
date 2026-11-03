def count_vowels(s)
  s.downcase.scan(/[aeiou]/).tally.sort.to_h
end

p count_vowels("Education is beautiful")
