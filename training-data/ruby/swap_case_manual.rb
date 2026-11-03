def swap_case(s)
  s.each_char.map { |c| c =~ /[[:upper:]]/ ? c.downcase : c.upcase }.join
end

puts swap_case("Hello World 42")
