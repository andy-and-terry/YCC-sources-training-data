# Amicable pairs: s(a) = b and s(b) = a with a < b, where s is the sum of
# proper divisors.
def s(n):
    return sum(d for d in range(1, n) if n % d == 0)

for a in range(2, 1500):
    b = s(a)
    if b > a and s(b) == a:
        print(a, b)
