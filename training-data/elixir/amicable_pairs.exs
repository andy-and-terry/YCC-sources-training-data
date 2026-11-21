# Amicable pairs below 1500 via sums of proper divisors.
s = fn n -> Enum.sum(for d <- 1..(n - 1)//1, rem(n, d) == 0, do: d) end

for a <- 2..1499, b = s.(a), b > a, s.(b) == a do
  IO.puts("#{a} #{b}")
end
