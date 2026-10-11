"aZ5 !é".each_char do |c|
  kinds = [] of String
  kinds << "letter" if c.letter?
  kinds << "upper" if c.uppercase?
  kinds << "lower" if c.lowercase?
  kinds << "digit" if c.number?
  kinds << "space" if c.whitespace?
  kinds << "other" if kinds.empty?
  puts "#{c.inspect} ord=#{c.ord} #{kinds.join('/')}"
end

puts 'a'.upcase
puts ('a'.ord + 2).chr
puts '7'.to_i
puts 'f'.to_i(16)
puts ('a'..'e').to_a.join
puts 'x' < 'y'
