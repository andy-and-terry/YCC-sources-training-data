def palindrome?(s : String) : Bool
  s == s.reverse
end

puts palindrome?("racecar")
puts palindrome?("hello")
