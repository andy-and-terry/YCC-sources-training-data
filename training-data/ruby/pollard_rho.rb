def rho(n)
  return 2 if n.even?
  f = ->(v) { (v * v + 1) % n }
  x = y = 2
  d = 1
  while d == 1
    x = f.(x)
    y = f.(f.(y))
    d = (x - y).abs.gcd(n)
  end
  d
end

n = 8051
p1 = rho(n)
puts "#{n} = #{p1} * #{n / p1}"
