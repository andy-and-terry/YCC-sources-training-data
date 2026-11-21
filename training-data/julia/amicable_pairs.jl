# Amicable pairs below 1500 via sums of proper divisors.
s(n) = sum(d for d in 1:n-1 if n % d == 0)

for a in 2:1499
    b = s(a)
    b > a && s(b) == a && println(a, " ", b)
end
