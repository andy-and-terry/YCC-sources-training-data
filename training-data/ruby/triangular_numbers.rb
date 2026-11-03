triangular = Enumerator.new do |y|
  sum = 0
  (1..).each { |n| y << (sum += n) }
end

p triangular.first(10)
