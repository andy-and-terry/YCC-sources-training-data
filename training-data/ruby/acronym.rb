def abbreviate(phrase)
  phrase.scan(/[A-Za-z][A-Za-z']*/).map { |w| w[0].upcase }.join
end

puts abbreviate("Portable Network Graphics")
puts abbreviate("Complementary metal-oxide semiconductor")
