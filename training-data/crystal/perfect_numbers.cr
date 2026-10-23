# Classify numbers as perfect, abundant or deficient by their aliquot sum.

enum Kind
  Perfect
  Abundant
  Deficient
end

def aliquot_sum(n : Int32) : Int32
  return 0 if n < 2
  sum = 1
  i = 2
  while i * i <= n
    if n % i == 0
      sum += i
      sum += n // i if i != n // i
    end
    i += 1
  end
  sum
end

def classify(n : Int32) : Kind
  s = aliquot_sum(n)
  if s == n
    Kind::Perfect
  elsif s > n
    Kind::Abundant
  else
    Kind::Deficient
  end
end

[6, 12, 15, 28, 496].each do |n|
  puts "#{n}: #{classify(n)}"
end

perfect = (2..10_000).select { |n| classify(n).perfect? }
puts "Perfect numbers up to 10000: #{perfect}"
