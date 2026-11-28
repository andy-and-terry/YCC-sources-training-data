def fact(n) = (1..n).reduce(1, :*)
def comb(n, k) = fact(n) / (fact(k) * fact(n - k))
def lah(n, k) = comb(n - 1, k - 1) * fact(n) / fact(k)

(1..5).each do |n|
  puts (1..n).map { |k| lah(n, k) }.join(" ")
end
