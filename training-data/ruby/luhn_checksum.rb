module Luhn
  module_function

  def sum(digits)
    digits.reverse.each_with_index.sum do |d, i|
      next d if i.even?

      d2 = d * 2
      d2 > 9 ? d2 - 9 : d2
    end
  end

  def valid?(str)
    s = str.delete(' ')
    s.match?(/\A\d{2,}\z/) && (sum(s.chars.map(&:to_i)) % 10).zero?
  end

  def check_digit(partial) = (10 - sum(partial.chars.map(&:to_i) + [0]) % 10) % 10
end

p [Luhn.valid?('4539 3195 0343 6467'), Luhn.valid?('8273 1232 7352 0569'), Luhn.valid?('12a4')]
puts "check digit for 7992739871: #{Luhn.check_digit('7992739871')}"
