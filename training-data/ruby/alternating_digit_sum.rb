def alternating_digit_sum(n)
  n.digits.each_with_index.sum { |d, i| i.even? ? d : -d }
end

[1234, 99_999, 1000].each { |n| puts "#{n} #{alternating_digit_sum(n)}" }
