require "big"

def fact(n : Int32) : BigInt
  (1..n).reduce(BigInt.new(1)) { |a, i| a * i }
end

def lah(n : Int32, k : Int32) : BigInt
  (fact(n - 1) // (fact(k - 1) * fact(n - k))) * fact(n) // fact(k)
end

(1..5).each do |n|
  puts (1..n).map { |k| lah(n, k) }.join(" ")
end
