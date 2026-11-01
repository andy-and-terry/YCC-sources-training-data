require "big"

# Reverse-and-add until a palindrome; count the steps.
def rev(n : BigInt) : BigInt
  BigInt.new(n.to_s.reverse)
end

def steps(start : Int32) : Int32
  n = BigInt.new(start)
  100.times do |count|
    return count if count > 0 && n == rev(n)
    n += rev(n)
  end
  -1
end

puts [56, 57, 59, 79, 89].map { |n| steps(n) }.join(" ")
