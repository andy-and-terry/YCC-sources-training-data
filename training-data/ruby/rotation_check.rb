def rotation?(a, b)
  a.length == b.length && (a * 2).include?(b)
end

puts rotation?("waterbottle", "erbottlewat")
puts rotation?("abc", "acb")
