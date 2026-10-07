def isogram?(word)
  letters = word.downcase.scan(/[a-z]/)
  letters.uniq.size == letters.size
end

%w[lumberjacks background six-year-old isograms].each { |w| puts "#{w} #{isogram?(w)}" }
