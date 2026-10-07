def aliquot_sum(n)
  return 0 if n == 1

  (2..Integer.sqrt(n)).select { |i| (n % i).zero? }.sum(1) { |i| i == n / i ? i : i + n / i }
end

def classify(n)
  case aliquot_sum(n) <=> n
  when 0 then :perfect
  when 1 then :abundant
  else :deficient
  end
end

[6, 12, 28, 13, 8128].each { |n| puts "#{n} #{classify(n)}" }
