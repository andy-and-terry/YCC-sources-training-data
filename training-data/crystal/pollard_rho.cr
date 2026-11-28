def rho(n : Int64) : Int64
  return 2_i64 if n.even?
  f = ->(v : Int64) { (v * v + 1) % n }
  x = y = 2_i64
  d = 1_i64
  while d == 1
    x = f.call(x)
    y = f.call(f.call(y))
    d = (x - y).abs.gcd(n)
  end
  d
end

n = 8051_i64
p1 = rho(n)
puts "#{n} = #{p1} * #{n // p1}"
