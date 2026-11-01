# Reverse-and-add until a palindrome; count the steps.
def steps(n)
  100.times do |count|
    return count if count > 0 && n.to_s == n.to_s.reverse
    n += n.to_s.reverse.to_i
  end
  nil
end

puts [56, 57, 59, 79, 89].map { |n| steps(n) }.join(" ")
