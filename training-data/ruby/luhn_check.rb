def luhn_valid?(input)
  s = input.delete(" ")
  return false if s.length < 2 || s =~ /\D/

  sum = s.reverse.chars.each_with_index.sum do |ch, i|
    d = ch.to_i
    d *= 2 if i.odd?
    d > 9 ? d - 9 : d
  end
  (sum % 10).zero?
end

puts luhn_valid?("4539 3195 0343 6467"), luhn_valid?("8273 1232 7352 0569")
