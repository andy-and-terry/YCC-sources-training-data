let xs = @[10, 20, 30, 40, 50, 60]

echo xs[1 .. 3]
echo xs[2 .. ^1]
echo xs[0 ..< 2]
echo xs[^2]
echo xs[^3 .. ^2]

var ys = xs
ys[1 .. 2] = @[-1, -2]
echo ys

ys.delete(0)
ys.insert(99, 0)
echo ys

ys.setLen(3)
echo ys
echo xs.len, " ", ys.high
