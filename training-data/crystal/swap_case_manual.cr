def swap_case(s : String) : String
  s.chars.map { |c| c.uppercase? ? c.downcase : c.upcase }.join
end

puts swap_case("Hello World 42")
