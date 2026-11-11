# Pronic numbers n(n+1)
def term(n)
  n * (n + 1)
end

puts (0..9).map { |n| term(n) }.join(" ")
