# Centered square numbers 2n(n+1)+1
def term(n)
  ((2 * n) * (n + 1)) + 1
end

puts (0..9).map { |n| term(n) }.join(" ")
