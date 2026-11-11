# Amicable pairs: d(a) == b and d(b) == a with a != b.
def d(n : Int32) : Int32
  (1...n).select { |i| n % i == 0 }.sum
end

(2...1500).each do |a|
  b = d(a)
  puts "#{a} #{b}" if b > a && d(b) == a
end
