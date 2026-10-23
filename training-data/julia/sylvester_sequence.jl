# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
s = big(2)
for i in 0:7
    println("s(", i, ") = ", s)
    global s = s * s - s + 1
end
