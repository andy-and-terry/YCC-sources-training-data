# Pernicious numbers: the popcount is prime.
def prime?(n : Int32) : Bool
  return false if n < 2
  (2..Math.sqrt(n).to_i).none? { |d| n % d == 0 }
end

puts (1..20).select { |n| prime?(n.popcount) }.join(" ")
