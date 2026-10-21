def harshad?(n)
  n.positive? && (n % n.digits.sum).zero?
end

puts (1...50).select { |n| harshad?(n) }.join(" ")
