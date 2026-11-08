def encode(xs : Array(Int32)) : Array(Int32)
  xs.each_with_index.map { |x, i| i == 0 ? x : x - xs[i - 1] }.to_a
end

def decode(ds : Array(Int32)) : Array(Int32)
  acc = 0
  ds.map { |d| acc += d }
end

d = encode([10, 12, 15, 15, 20])
p d
p decode(d)
