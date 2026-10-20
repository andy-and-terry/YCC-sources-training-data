a, (b, *c), d = 1, [2, 3, 4], 5
puts [a, b, c, d].inspect
first, *mid, last = *1..6
puts mid.inspect
h = {x: 1, y: 2}
def kw(x:, y: 0, **rest) = [x, y, rest]
puts kw(**h, z: 3).inspect
def opt(a, b = a * 2, *r, k: 1, &blk) = [a, b, r, k]
puts opt(1).inspect, opt(1, 2, 3, k: 4).inspect
a, b = b, a
puts a, b
