# Integer (1..3999) to Roman numeral using a greedy table.
TABLE = {
  1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC",
  50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"
}.freeze

def to_roman(n)
  TABLE.reduce(+"") do |out, (value, symbol)|
    count, n = n.divmod(value)
    out << symbol * count
  end
end

puts "#{to_roman(1994)} #{to_roman(58)}"
