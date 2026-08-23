def word_frequency(text : String) : Array(Tuple(String, Int32))
  words = text.downcase.split(" ")
  counts = Hash(String, Int32).new(0)
  words.each { |w| counts[w] += 1 }
  counts.to_a.sort_by { |(_, count)| -count }
end

word_frequency("the quick brown fox jumps over the lazy dog the fox runs").each do |(word, count)|
  puts "#{word}: #{count}"
end
