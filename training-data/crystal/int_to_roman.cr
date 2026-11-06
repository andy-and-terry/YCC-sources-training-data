# Integer (1..3999) to Roman numeral using a greedy table.
TABLE = [
  {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"},
  {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"},
]

def to_roman(n : Int32) : String
  String.build do |io|
    TABLE.each do |value, symbol|
      while n >= value
        io << symbol
        n -= value
      end
    end
  end
end

puts "#{to_roman(1994)} #{to_roman(58)}"
