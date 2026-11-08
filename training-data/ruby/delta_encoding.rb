def encode(xs) = [xs.first] + xs.each_cons(2).map { |a, b| b - a }

def decode(ds)
  acc = 0
  ds.map { |d| acc += d }
end

d = encode([10, 12, 15, 15, 20])
p d, decode(d)
