def count_vowels(s : String)
  s.downcase.chars.select { |c| "aeiou".includes?(c) }.tally
end

p count_vowels("Education is beautiful")
