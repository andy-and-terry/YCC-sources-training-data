def persistence(n)
  steps = 0
  while n >= 10
    n = n.digits.reduce(:*)
    steps += 1
  end
  steps
end

[39, 77, 999, 10].each { |n| puts "#{n} #{persistence(n)}" }
