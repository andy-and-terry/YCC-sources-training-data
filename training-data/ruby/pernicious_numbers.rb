# Pernicious numbers: the popcount is prime.
def prime?(n)
  n >= 2 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

puts (1..20).select { |n| prime?(n.to_s(2).count("1")) }.join(" ")
