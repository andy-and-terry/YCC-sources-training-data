# Amicable pairs: d(a) == b and d(b) == a with a != b.
d(n) = sum(i for i in 1:n-1 if n % i == 0)

for a in 2:1499
    b = d(a)
    b > a && d(b) == a && println(a, " ", b)
end
