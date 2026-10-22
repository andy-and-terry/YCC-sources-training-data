# Farey sequence F_n: reduced fractions in [0, 1] with denominator <= n.
def farey(n)
  fracs = []
  (1..n).each do |b|
    (0..b).each { |a| fracs << [a, b] if a.gcd(b) == 1 }
  end
  fracs.sort_by { |a, b| Rational(a, b) }.map { |a, b| "#{a}/#{b}" }
end

puts farey(5).join(" ")
