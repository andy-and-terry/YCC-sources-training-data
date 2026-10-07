# Digit-by-digit addition and schoolbook multiplication on decimal strings,
# checked against Ruby's native arbitrary-precision Integer.
def add_strings(a, b)
  a = a.reverse
  b = b.reverse
  carry = 0
  out = []
  [a.size, b.size].max.times do |i|
    s = a[i].to_i + b[i].to_i + carry
    out << s % 10
    carry = s / 10
  end
  out << carry if carry.positive?
  out.reverse.join
end

def multiply_strings(a, b)
  res = Array.new(a.size + b.size, 0)
  a.reverse.each_char.with_index do |x, i|
    b.reverse.each_char.with_index do |y, j|
      res[i + j] += x.to_i * y.to_i
      res[i + j + 1] += res[i + j] / 10
      res[i + j] %= 10
    end
  end
  res.reverse.join.sub(/\A0+(?=\d)/, '')
end

puts add_strings('99999999999999999999', '1')
x = '31415926535897932384626433832795'
y = '27182818284590452353602874713527'
puts multiply_strings(x, y) == (x.to_i * y.to_i).to_s
puts "50! = #{(1..50).reduce(:*)}"
