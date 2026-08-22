primes = Enumerator.new do |y|
  n = 2
  loop do
    y << n if (2...n).none? { |i| (n % i).zero? }
    n += 1
  end
end

puts primes.lazy.first(10).inspect
