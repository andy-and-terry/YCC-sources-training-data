def int_to_roman(num : Int32) : String
  values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  n = num
  result = String.build do |str|
    values.each_with_index do |value, i|
      while n >= value
        str << symbols[i]
        n -= value
      end
    end
  end
  result
end

puts int_to_roman(1994)
