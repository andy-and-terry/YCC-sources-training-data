def prime?(n)
  return false if n < 2
  return true if [2, 3].include?(n)
  return false if n.even?

  i = 3
  while i * i <= n
    return false if n % i == 0
    i += 2
  end
  true
end

puts (0...20).select { |n| prime?(n) }.inspect
