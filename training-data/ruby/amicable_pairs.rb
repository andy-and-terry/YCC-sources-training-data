# Amicable pairs below 1500 via sums of proper divisors.
def s(n)
  (1...n).select { |d| (n % d).zero? }.sum
end

(2...1500).each do |a|
  b = s(a)
  puts "#{a} #{b}" if b > a && s(b) == a
end
