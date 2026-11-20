# Aliquot sum classification.
[6, 12, 15, 28].each do |n|
  a = (1...n).select { |d| n % d == 0 }.sum
  kind = a == n ? "perfect" : a > n ? "abundant" : "deficient"
  puts "#{n} #{a} #{kind}"
end
