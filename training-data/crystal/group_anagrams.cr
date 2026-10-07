def group_anagrams(words : Array(String)) : Array(Array(String))
  groups = {} of String => Array(String)
  words.each do |word|
    key = word.chars.sort.join
    groups[key] ||= [] of String
    groups[key] << word
  end
  groups.values
end

words = ["eat", "tea", "tan", "ate", "nat", "bat"]
puts group_anagrams(words).inspect
