# Lazy caterer sequence: max pieces from n cuts
def term(n)
  ((n * (n + 1))/2) + 1
end

puts (0..9).map { |n| term(n) }.join(" ")
