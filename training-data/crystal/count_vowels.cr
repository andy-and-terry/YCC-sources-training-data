def count_vowels(s : String) : Int32
  s.count { |c| "aeiou".includes?(c) }
end

puts count_vowels("hello world")
