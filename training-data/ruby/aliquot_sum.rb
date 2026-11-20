# Aliquot sum and classification.
def aliquot(n) = (1...n).select { |d| (n % d).zero? }.sum
[6, 12, 15, 28].each do |n|
  a = aliquot(n)
  puts "#{n} #{a} #{a == n ? 'perfect' : a > n ? 'abundant' : 'deficient'}"
end
