def egyptian(frac)
  parts = []
  while frac.numerator != 0
    d = (1 / frac).ceil
    parts << Rational(1, d)
    frac -= Rational(1, d)
  end
  parts
end

r = egyptian(Rational(4, 13))
puts r.map(&:to_s).join(" + ")
raise "bad" unless r.sum == Rational(4, 13)
