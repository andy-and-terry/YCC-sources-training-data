# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
def hamming?(n : Int32) : Bool
  {2, 3, 5}.each do |p|
    n //= p while n % p == 0
  end
  n == 1
end

found = [] of Int32
n = 1
while found.size < 20
  found << n if hamming?(n)
  n += 1
end
puts found.join(" ")
